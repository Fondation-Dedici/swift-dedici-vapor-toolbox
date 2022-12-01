//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import NIO
import Vapor

extension Application {
    public enum PublishConfigurationError: Error {
        case configurationPublishFailedTooManyTimes(maxAttempts: Int)
        case serverRespondedWithFailureCode(response: HTTPClient.Response)
    }

    public func publishConfigUntilSuccess<T: Codable>(
        config: T,
        key: String,
        retryAfter: UInt32 = 5,
        retryDelayMultiplier: Double = 1.5,
        maxRetryDelay: UInt32 = 60,
        maxAttempts: Int = 20
    ) -> EventLoopFuture<Void> {
        let maxDelay = max(min(60, maxRetryDelay), 5)
        var delay: UInt32 = min(max(retryAfter, 5), maxDelay)
        let delayMultiplier: Double = max(1, retryDelayMultiplier)
        var attempt = 0
        let maxAttempts = max(maxAttempts, 1)

        while true {
            do {
                logger.notice("Attempting (#: \(attempt + 1)/\(maxAttempts)) to publish configuration…")
                try publishConfiguration(config: config, key: key).wait()
                logger.notice("Configuration publication completed successfully")
                return eventLoopGroup.future()
            } catch {
                logger.error("Configuration publication failed because: \(error)")
            }
            attempt += 1
            guard attempt < maxAttempts else { break }
            logger.notice("Waiting \(delay)s before next configuration publication attempt…")
            sleep(delay)
            delay = min(UInt32(Double(delay) * delayMultiplier), 60)
        }

        return eventLoopGroup.future(
            error: PublishConfigurationError
                .configurationPublishFailedTooManyTimes(maxAttempts: maxAttempts)
        )
    }

    private func publishConfiguration<T: Codable>(config: T, key: String) throws -> EventLoopFuture<Void> {
        let url = try Environment.require(key: "NX_CONFIG_SERVICE_URL", using: URL.init(string:))
        let timeout = try Environment.require(key: "NX_CONFIG_SERVICE_TIMEOUT", using: Int64.init)

        let client = http.client.shared
        let encoder = ContentConfiguration.jsonEncoder
        let decoder = ContentConfiguration.jsonDecoder
        let data = try encoder.encode(config)
        let jsonValue = try decoder.decode(JsonValue.self, from: data)
        let fullData = try encoder.encode([key: jsonValue])
        var headers = HTTPHeaders()
        headers.contentType = .json
        let request = try HTTPClient.Request(url: url, method: .PATCH, headers: headers, body: .data(fullData))
        return client.execute(request: request, deadline: .now() + .seconds(timeout))
            .flatMapThrowing { response in
                guard (200 ..< 300).contains(response.status.code)
                else { throw PublishConfigurationError.serverRespondedWithFailureCode(response: response) }
            }
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct ContentConfiguration: AppConfiguration {
    public static let dateFormatter: ISO8601DateFormatter = {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()

    public static let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        encoder.dateEncodingStrategy = .custom { date, encoder in
            let string = dateFormatter.string(from: date)
            var container = encoder.singleValueContainer()
            try container.encode(string)
        }
        return encoder
    }()

    public static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            guard let date = dateFormatter.date(from: string) else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Could not parse ISO8601 date string: \(string)"
                )
            }
            return date
        }
        return decoder
    }()

    public init() {}

    public func configure(_: Application) throws {
        Vapor.ContentConfiguration.global.use(encoder: Self.jsonEncoder, for: .json)
        Vapor.ContentConfiguration.global.use(decoder: Self.jsonDecoder, for: .json)
    }
}

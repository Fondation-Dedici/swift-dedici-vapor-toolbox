//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct VersionMiddleware: Middleware {
    let apiVersion = Environment.apiVersion

    public init() {}

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        let versionStatus: VersionStatus?
        do {
            versionStatus = try VersionStatus(for: request, and: apiVersion)
            try versionStatus.flatMap { try verify(status: $0) }
        } catch {
            return request.eventLoop.makeFailedFuture(error)
        }
        return next.respond(to: request)
            .map { response in
                response.headers = apiVersion.updatedHeaders(from: response.headers, considering: versionStatus)
                return response
            }
    }

    private func verify(status: VersionStatus) throws {
        switch status {
        case .notYetSupported:
            throw VersionError(type: .versionNotYetSupported, status: status, version: apiVersion)
        case .noLongerSupported:
            throw VersionError(type: .versionNoLongerSupported, status: status, version: apiVersion)
        case .supported, .deprecated:
            return
        }
    }
}

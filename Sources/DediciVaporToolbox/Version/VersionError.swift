//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct VersionError: SpecificError {
    public struct Body: Content {
        let currentVersion: UInt32?
        let deprecatedVersion: UInt32?
        let minimumVersion: UInt32?
        let status: VersionStatus?
    }

    public enum ErrorType: String, Hashable, Codable {
        case versionNotYetSupported
        case versionNoLongerSupported
        case versionHeaderIsMissing
    }

    public let type: ErrorType
    public let status: VersionStatus?
    public let version: ApiVersion
    public var rawValue: String { type.rawValue }

    public func body() throws -> Response.Body {
        let body = Body(
            currentVersion: version.currentVersion,
            deprecatedVersion: version.deprecatedVersion,
            minimumVersion: version.minimumVersion,
            status: status
        )
        let data = try JSONEncoder().encode(body)
        return .init(data: data)
    }
}

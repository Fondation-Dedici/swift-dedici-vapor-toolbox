//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct ApiVersion: Content, Hashable {
    public let currentVersion: UInt32?
    public let deprecatedVersion: UInt32?
    public let minimumVersion: UInt32?

    public init(currentVersion: UInt32?, deprecatedVersion: UInt32?, minimumVersion: UInt32?) {
        self.currentVersion = currentVersion
        self.deprecatedVersion = deprecatedVersion
        self.minimumVersion = minimumVersion
    }

    func updatedHeaders(
        from headers: HTTPHeaders = .init(),
        considering status: VersionStatus? = nil
    ) -> HTTPHeaders {
        var headers = headers
        headers.nxVersionCurrent = currentVersion
        headers.nxVersionMinimum = minimumVersion
        headers.nxVersionDeprecated = deprecatedVersion
        headers.nxVersionStatus = status
        return headers
    }
}

extension Environment {
    public static let apiVersion: ApiVersion = .init(
        currentVersion: try? Environment.require(key: "VERSION_CURRENT", using: UInt32.init),
        deprecatedVersion: try? Environment.require(key: "VERSION_DEPRECATED", using: UInt32.init),
        minimumVersion: try? Environment.require(key: "VERSION_MINIMUM", using: UInt32.init)
    )
}

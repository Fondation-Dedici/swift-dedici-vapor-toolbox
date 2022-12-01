//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public enum VersionStatus: String, Hashable, Codable {
    case notYetSupported
    case noLongerSupported
    case supported
    case deprecated

    init?(for request: Request, and apiVersion: ApiVersion) throws {
        guard let currentVersion = apiVersion.currentVersion else { return nil }
        guard let requestVersion = request.headers.nxVersion else {
            throw VersionError(type: .versionHeaderIsMissing, status: nil, version: apiVersion)
        }

        let status: VersionStatus
        if let minimumVersion = apiVersion.minimumVersion, requestVersion < minimumVersion {
            status = .noLongerSupported
        } else if let deprecatedVersion = apiVersion.deprecatedVersion, requestVersion <= deprecatedVersion {
            status = .deprecated
        } else if requestVersion <= currentVersion {
            status = .supported
        } else {
            status = .notYetSupported
        }
        self = status
    }
}

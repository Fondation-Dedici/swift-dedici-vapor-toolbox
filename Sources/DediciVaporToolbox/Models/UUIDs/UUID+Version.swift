//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUID {
    public enum Version: UInt8, Codable, Hashable, CaseIterable {
        case v1 = 1
        case v2 = 2
        case v3 = 3
        case v4 = 4
        case v5 = 5
    }

    /// The version as defined in the [RFC4122](https://tools.ietf.org/html/rfc4122).
    ///
    /// It will be nil if `variant` is undefined or unknown since the "versions"
    /// defined in the standard only exist for variant 1 and 2.
    public var version: Version? {
        guard let version = Version(rawValue: uuid.6 >> 4) else { return nil }
        guard variant.versions.contains(version) else { return nil }
        return version
    }
}

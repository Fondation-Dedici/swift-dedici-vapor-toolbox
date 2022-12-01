//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUIDv4 {
    public enum Error: Swift.Error {
        case notV4(actualVersion: UUID.Version?)
        case notVariant1(actualVariant: UUID.Variant)
    }
}

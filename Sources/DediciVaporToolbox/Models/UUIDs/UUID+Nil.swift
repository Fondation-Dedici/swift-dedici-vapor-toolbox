//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUID {
    /// True if all bytes are 0x00 bytes as defined in the RFC4122.
    public var isNil: Bool {
        uuid.0 == 0 &&
            uuid.1 == 0 &&
            uuid.2 == 0 &&
            uuid.3 == 0 &&
            uuid.4 == 0 &&
            uuid.5 == 0 &&
            uuid.6 == 0 &&
            uuid.7 == 0 &&
            uuid.8 == 0 &&
            uuid.9 == 0 &&
            uuid.10 == 0 &&
            uuid.11 == 0 &&
            uuid.12 == 0 &&
            uuid.13 == 0 &&
            uuid.14 == 0 &&
            uuid.15 == 0
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Dictionary {
    /// Returns this dictionary if it's not empty, otherwise nil.
    public func nilIfEmpty() -> Self? {
        isEmpty ? nil : self
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

extension Optional {
    /// Returns the unwrapped version of the value or the `default` if it's nil.
    ///
    /// - parameter default: The value to be returned if it's nil
    public func unwrapped(or default: Wrapped) -> Wrapped {
        self ?? `default`
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    /// Returns this collection if it's not empty, otherwise nil.
    public func nilIfEmpty() -> Self? {
        isEmpty ? nil : self
    }
}

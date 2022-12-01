//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension String {
    public mutating func removeEnvironmentQuotes() {
        let quotes = "\""
        guard hasPrefix(quotes), hasSuffix(quotes) else { return }

        removeFirst(quotes.count)
        removeLast(quotes.count)
    }

    public func removingEnvironmentQuotes() -> String {
        var output = self
        output.removeEnvironmentQuotes()
        return output
    }
}

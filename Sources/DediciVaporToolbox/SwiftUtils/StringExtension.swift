//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension String {
    public func nilIfEmptyOrWhitespace() -> String? {
        if isEmpty { return nil }
        if trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return nil }
        return self
    }

    public func isEmptyOrWhitespace() -> Bool {
        nilIfEmptyOrWhitespace() == nil
    }

    public func trimmingWhitespaces() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public func trimmingWhitespacesOrNil() -> String? {
        trimmingWhitespaces()
            .nilIfEmptyOrWhitespace()
    }
}

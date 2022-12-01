//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension String {
    public mutating func splitEnvironmentInlineBase64() {
        self = replacingOccurrences(of: "||", with: "\n")
    }

    public func splittingEnvironmentInlineBase64() -> String {
        var output = self
        output.splitEnvironmentInlineBase64()
        return output
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUID {
    public static var size: Int { 16 }

    public enum SizeError: Error {
        case tooMuchBytes
        case notEnoughBytes
    }
}

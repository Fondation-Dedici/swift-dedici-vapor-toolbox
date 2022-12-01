//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders {
    /// NX-Error-Code header.
    public var nxErrorCode: String? {
        get { first(name: .nxErrorCode) }
        set {
            remove(name: .nxErrorCode)
            newValue.flatMap { replaceOrAdd(name: .nxErrorCode, value: $0) }
        }
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension Environment {
    public enum RequirementError: Error {
        case failedToLoadValue(key: String)
        case transformationReturnedNil(key: String)
    }
}

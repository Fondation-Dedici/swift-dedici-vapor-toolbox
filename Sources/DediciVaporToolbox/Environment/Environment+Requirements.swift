//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension Environment {
    public static func require(key: String) throws -> String {
        guard let value = get(key)?.removingEnvironmentQuotes() else {
            throw Environment.RequirementError.failedToLoadValue(key: key)
        }
        return value
    }

    public static func require<T>(key: String, using transform: (String) throws -> T?) throws -> T {
        guard let value = try transform(try require(key: key)) else {
            throw Environment.RequirementError.transformationReturnedNil(key: key)
        }
        return value
    }
}

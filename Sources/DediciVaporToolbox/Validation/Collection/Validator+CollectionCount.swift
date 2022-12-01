//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension Validator where T: Collection {
    public static func count(_ count: Int) -> Validator<T> {
        .init { (value: T) in
            ValidatorResults.CollectionCount(
                hasEqualCount: value.count == count,
                requiredCount: count
            )
        }
    }
}

extension ValidatorResults {
    public struct CollectionCount {
        public let hasEqualCount: Bool
        public let requiredCount: Int
    }
}

extension ValidatorResults.CollectionCount: ValidatorResult {
    public var isFailure: Bool { !hasEqualCount }
    public var successDescription: String? { "has the correct count (\(requiredCount))" }
    public var failureDescription: String? { "does not have the correct count (\(requiredCount))" }
}

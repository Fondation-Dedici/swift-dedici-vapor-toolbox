//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension Validator where T: Collection {
    public static func count<S: Sequence>(_ counts: S) -> Validator<T> where S.Element == Int {
        .init { (value: T) in
            let counts = Set(counts)
            return ValidatorResults.CollectionCounts(
                hasCorrectCount: counts.contains(value.count),
                correctCounts: counts
            )
        }
    }
}

extension ValidatorResults {
    public struct CollectionCounts {
        public let hasCorrectCount: Bool
        public let correctCounts: Set<Int>

        private var prettyCountsList: String {
            correctCounts.map { "\($0)" }.joined(separator: ", ")
        }
    }
}

extension ValidatorResults.CollectionCounts: ValidatorResult {
    public var isFailure: Bool { !hasCorrectCount }
    public var successDescription: String? { "has a correct count (valid counts are: \(prettyCountsList))" }
    public var failureDescription: String? { "does not have a correct count (valid counts are: \(prettyCountsList))" }
}

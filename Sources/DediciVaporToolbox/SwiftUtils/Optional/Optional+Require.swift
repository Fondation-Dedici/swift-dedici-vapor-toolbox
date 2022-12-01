//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Optional {
    public enum RequirementError: Error {
        case failedToRequireOptional
    }
}

extension Optional {
    public func require(
        or error: @autoclosure () -> Error = RequirementError.failedToRequireOptional
    ) throws -> Wrapped {
        guard let value = wrapped else { throw error() }
        return value
    }

    public func require(orFatalErrorWith message: @autoclosure () -> String) -> Wrapped {
        guard let value = wrapped else { fatalError(message()) }
        return value
    }
}

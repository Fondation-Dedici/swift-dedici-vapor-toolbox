//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension JsonValue {
    public var isNil: Bool {
        switch self {
        case .null: return true
        default: return false
        }
    }

    public var isBool: Bool {
        switch self {
        case .bool: return true
        default: return false
        }
    }

    public var isNumber: Bool {
        switch self {
        case .number: return true
        default: return false
        }
    }

    public var isString: Bool {
        switch self {
        case .string: return true
        default: return false
        }
    }

    public var isArray: Bool {
        switch self {
        case .array: return true
        default: return false
        }
    }

    public var isObject: Bool {
        switch self {
        case .object: return true
        default: return false
        }
    }
}

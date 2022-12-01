//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension JsonValue {
    public var bool: JsonBool? {
        switch self {
        case .bool(let value): return value
        default: return nil
        }
    }

    public var number: JsonNumber? {
        switch self {
        case .number(let value): return value
        default: return nil
        }
    }

    public var string: JsonString? {
        switch self {
        case .string(let value): return value
        default: return nil
        }
    }

    public var array: JsonArray? {
        switch self {
        case .array(let value): return value
        default: return nil
        }
    }

    public var object: JsonObject? {
        switch self {
        case .object(let value): return value
        default: return nil
        }
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public protocol SanitizedValue: Codable {
    associatedtype Value: Codable

    var value: Value { get }

    init(sanitizing rawValue: Value) throws
}

extension SanitizedValue {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(Value.self)
        try self.init(sanitizing: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension JsonValue: Codable {
    public enum DecodingError: Error {
        case couldNotRetrieveContainer
    }

    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: AnyCodingKey.self) {
            self = try Self.value(from: container)
        } else if var container = try? decoder.unkeyedContainer() {
            self = try Self.value(from: &container)
        } else if let container = try? decoder.singleValueContainer() {
            self = try Self.value(from: container)
        } else {
            throw DecodingError.couldNotRetrieveContainer
        }
    }

    private static func value(from container: SingleValueDecodingContainer) throws -> JsonValue {
        if container.decodeNil() {
            return .null
        } else if let value = try? container.decode(JsonBool.self) {
            return .bool(value)
        } else if let value = try? container.decode(JsonNumber.self) {
            return .number(value)
        } else if let value = try? container.decode(JsonString.self) {
            return .string(value)
        } else {
            throw Swift.DecodingError.dataCorruptedError(in: container, debugDescription: "Unexpected type")
        }
    }

    private static func value(from container: inout UnkeyedDecodingContainer) throws -> JsonValue {
        var array = JsonArray()
        while !container.isAtEnd {
            array.append(try container.decode(JsonValue.self))
        }
        return .array(array)
    }

    private static func value(from container: KeyedDecodingContainer<AnyCodingKey>) throws -> JsonValue {
        let object: JsonObject = try container.allKeys.reduce(into: .init()) {
            $0[$1.stringValue] = try container.decode(JsonValue.self, forKey: $1)
        }
        return .object(object)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .null: try container.encodeNil()
        case .bool(let value): try container.encode(value)
        case .number(let value): try container.encode(value)
        case .string(let value): try container.encode(value)
        case .array(let value): try container.encode(value)
        case .object(let value): try container.encode(value)
        }
    }
}

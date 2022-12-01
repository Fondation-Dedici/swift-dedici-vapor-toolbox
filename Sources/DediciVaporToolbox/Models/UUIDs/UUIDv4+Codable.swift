//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUIDv4: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(value)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let value = try container.decode(UUID.self)
        do {
            try Self.validate(value)
        } catch {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "UUID do not validate because: \(error))"
            )
        }

        self.value = value
    }
}

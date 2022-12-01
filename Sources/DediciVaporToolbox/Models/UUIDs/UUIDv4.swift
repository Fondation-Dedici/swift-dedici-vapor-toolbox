//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct UUIDv4: Hashable {
    public let value: UUID

    public init() {
        self.value = .init()
    }

    public init(value: UUID) throws {
        try Self.validate(value)

        self.value = value
    }

    static func validate(_ value: UUID) throws {
        guard value.version == .v4 else {
            throw Error.notV4(actualVersion: value.version)
        }
        guard value.variant == .variant1 else {
            throw Error.notVariant1(actualVariant: value.variant)
        }
    }
}

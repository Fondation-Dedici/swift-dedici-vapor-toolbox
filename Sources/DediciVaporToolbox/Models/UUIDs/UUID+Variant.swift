//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUID {
    public enum Variant: UInt8, Codable, Hashable, CaseIterable, Comparable {
        case variant0 = 0b0000_0000
        case variant1 = 0b1000_0000
        case variant2 = 0b1100_0000
        case reserved = 0b1110_0000

        public var mask: UInt8 {
            switch self {
            case .variant0: return 0b1000_0000
            case .variant1: return 0b1100_0000
            case .variant2: return 0b1110_0000
            case .reserved: return 0b1110_0000
            }
        }

        public var versions: Set<Version> {
            switch self {
            case .variant1, .variant2: return Set(Version.allCases)
            case .variant0, .reserved: return []
            }
        }

        public init(of uuid: UUID) {
            // This unwrapping cannot fail since all variants combined cover all possible cases.
            guard let value = Variant.allCases.sorted().first(where: { $0.matches(byte: uuid.uuid.8) }) else {
                fatalError("Impossible case")
            }
            self = value
        }

        public static func < (lhs: UUID.Variant, rhs: UUID.Variant) -> Bool { lhs.rawValue < rhs.rawValue }

        public func matches(byte: UInt8) -> Bool { byte & mask == rawValue }
    }

    /// The variant as defined in the [RFC4122](https://tools.ietf.org/html/rfc4122).
    public var variant: Variant { Variant(of: self) }

    public func settingVariant(to variant: Variant) -> Self {
        var newSelfUuid = uuid
        newSelfUuid.8 = newSelfUuid.8 & ~variant.mask | variant.rawValue
        return .init(uuid: newSelfUuid)
    }
}

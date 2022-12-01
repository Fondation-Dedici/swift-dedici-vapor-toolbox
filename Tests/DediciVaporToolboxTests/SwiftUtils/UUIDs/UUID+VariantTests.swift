//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDVariantTests: XCTestCase {
    let nilUuid: UUID = {
        let data = Data(count: UUID.size)
        do {
            return try UUID(data: data)
        } catch {
            fatalError("Failed to generate UUID mock with: \(data.hex)")
        }
    }()

    private func uuidMock(for variant: UUID.Variant) -> UUID {
        var data = Data(randomBytes: UUID.size)
        data[8] = data[8] & ~variant.mask | variant.rawValue
        do {
            return try UUID(data: data)
        } catch {
            fatalError("Failed to generate UUID mock with: \(data.hex)")
        }
    }

    func testNilIsVariant0() {
        XCTAssertEqual(nilUuid.variant, .variant0)
    }

    func testVariantIsMatchVariant() {
        UUID.Variant.allCases
            .forEach { variant in
                XCTAssertEqual(uuidMock(for: variant).variant, variant)
            }
        XCTAssertEqual(uuidMock(for: .variant0).variant, .variant0)
    }

    func testVariantResolveToSameVariant() {
        UUID.Variant.allCases
            .forEach { variant in
                XCTAssertEqual(UUID(uuid: uuidMock(for: variant).uuid).variant, variant)
            }
    }

    func testDefaultUuidIsVariant1() {
        XCTAssertEqual(UUID().variant, .variant1)
    }

    func testSettingToAnotherVariant() {
        UUID.Variant.allCases
            .forEach { variant in
                UUID.Variant.allCases
                    .forEach {
                        XCTAssertEqual(uuidMock(for: $0).settingVariant(to: variant).variant, variant)
                    }
            }
    }

    // MARK: - RFC4122 tests

    func testMasks() {
        XCTAssertEqual(UUID.Variant.variant0.mask, 0b1000_0000)
        XCTAssertEqual(UUID.Variant.variant1.mask, 0b1100_0000)
        XCTAssertEqual(UUID.Variant.variant2.mask, 0b1110_0000)
        XCTAssertEqual(UUID.Variant.reserved.mask, 0b1110_0000)
    }

    func testRawValues() {
        XCTAssertEqual(UUID.Variant.variant0.rawValue, 0b0000_0000)
        XCTAssertEqual(UUID.Variant.variant1.rawValue, 0b1000_0000)
        XCTAssertEqual(UUID.Variant.variant2.rawValue, 0b1100_0000)
        XCTAssertEqual(UUID.Variant.reserved.rawValue, 0b1110_0000)
    }
}

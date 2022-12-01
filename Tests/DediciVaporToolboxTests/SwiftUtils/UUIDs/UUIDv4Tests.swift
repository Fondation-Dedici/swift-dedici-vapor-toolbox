//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import XCTest
@testable import DediciVaporToolbox

public class UUIDv4Tests: XCTestCase {
    private func uuidMock(for variant: UUID.Variant, and version: UUID.Version) -> UUID {
        var data = Data(randomBytes: UUID.size)
        data[6] = data[6] & 0b0000_1111 | (version.rawValue << 4)
        data[8] = data[8] & ~variant.mask | variant.rawValue
        do {
            return try UUID(data: data)
        } catch {
            fatalError("Failed to generate UUID mock with: \(data.hex)")
        }
    }

    func testValidateNotV4Error() {
        let notV4Uuid = uuidMock(for: .variant1, and: .v2)

        XCTAssertThrowsError(try UUIDv4.validate(notV4Uuid))
    }

    func testValidateNotVariant1Error() {
        let notVariantUuid = uuidMock(for: .variant2, and: .v4)

        XCTAssertThrowsError(try UUIDv4.validate(notVariantUuid))
    }

    func testValidateValid() {
        let uuid = uuidMock(for: .variant1, and: .v4)

        XCTAssertNoThrow(try UUIDv4.validate(uuid))
    }

    func testInitNotV4Error() {
        let notV4Uuid = uuidMock(for: .variant1, and: .v2)

        XCTAssertThrowsError(try UUIDv4(value: notV4Uuid))
    }

    func testInitNotVariant1Error() {
        let notVariantUuid = uuidMock(for: .variant2, and: .v4)

        XCTAssertThrowsError(try UUIDv4(value: notVariantUuid))
    }

    func testInitValid() {
        let uuid = uuidMock(for: .variant1, and: .v4)

        XCTAssertNoThrow(try UUIDv4(value: uuid))
    }

    func testDecodeNotV4Error() throws {
        let notV4Uuid = uuidMock(for: .variant1, and: .v2)
        let data = try JSONEncoder().encode(notV4Uuid)

        XCTAssertThrowsError(try JSONDecoder().decode(UUIDv4.self, from: data))
    }

    func testDecodeNotVariant1Error() throws {
        let notVariantUuid = uuidMock(for: .variant2, and: .v4)
        let data = try JSONEncoder().encode(notVariantUuid)

        XCTAssertThrowsError(try JSONDecoder().decode(UUIDv4.self, from: data))
    }

    func testDecodeValid() throws {
        let uuid = uuidMock(for: .variant1, and: .v4)
        let data = try JSONEncoder().encode(uuid)

        XCTAssertNoThrow(try JSONDecoder().decode(UUIDv4.self, from: data))
    }

    func testCodableOutput() throws {
        let uuid = uuidMock(for: .variant1, and: .v4)
        let uuidV4 = try UUIDv4(value: uuid)

        let uuidData = try JSONEncoder().encode(uuid)
        let uuidV4Data = try JSONEncoder().encode(uuidV4)

        XCTAssertEqual(uuidData, uuidV4Data)
    }

    func testEmptyInit() {
        let uuidV4 = UUIDv4()

        XCTAssertNoThrow(try UUIDv4.validate(uuidV4.value))
    }
}

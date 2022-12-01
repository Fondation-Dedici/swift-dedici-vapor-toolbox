//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDVersionTests: XCTestCase {
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

    func testRawValues() {
        XCTAssertEqual(UUID.Version.v1.rawValue, 1)
        XCTAssertEqual(UUID.Version.v2.rawValue, 2)
        XCTAssertEqual(UUID.Version.v3.rawValue, 3)
        XCTAssertEqual(UUID.Version.v4.rawValue, 4)
        XCTAssertEqual(UUID.Version.v5.rawValue, 5)
    }

    func testVariantsVersions() {
        UUID.Variant.allCases.forEach { variant in
            let versions = UUID.Version.allCases
                .map { version -> UUID in
                    uuidMock(for: variant, and: version)
                }
                .compactMap(\.version)
            XCTAssertEqual(variant.versions, Set(versions))
        }
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDNilTests: XCTestCase {
    func testNil() throws {
        let uuid = try UUID(data: .init(repeating: 0x00, count: 16))

        XCTAssertTrue(uuid.isNil)
    }

    func testNotNil() throws {
        let uuid = UUID()

        XCTAssertFalse(uuid.isNil)
    }
}

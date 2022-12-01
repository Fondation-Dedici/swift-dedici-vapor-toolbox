//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDSizeTests: XCTestCase {
    func testSize() {
        XCTAssertEqual(UUID.size, 16)
    }
}

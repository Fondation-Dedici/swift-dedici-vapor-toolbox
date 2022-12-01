//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTVapor
@testable import DediciVaporToolbox

internal final class CanBeDisabledTests: XCTestCase {
    struct ModelMock: CanBeDisabled {
        var disablingDate: Date?
    }

    var value = ModelMock()
    let now = Date()

    func testHasBeenDisabled() {
        value.disablingDate = now
        XCTAssertTrue(value.hasBeenDisabled)
    }

    func testHasBeenDisabledInFuture() {
        value.disablingDate = now.addingTimeInterval(86400)
        XCTAssertFalse(value.hasBeenDisabled)
    }

    func testHasNotBeenDisabled() {
        value.disablingDate = nil
        XCTAssertFalse(value.hasBeenDisabled)
    }

    func testMarkAsDisabled() {
        value.disablingDate = nil
        XCTAssertFalse(value.hasBeenDisabled)
        value.markAsDisabled()
        XCTAssertTrue(value.hasBeenDisabled)
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTVapor
@testable import DediciVaporToolbox

internal final class CanBeDeletedTests: XCTestCase {
    struct ModelMock: CanBeDeleted {
        var deletionDate: Date?
    }

    var value = ModelMock()
    let now = Date()

    func testHasBeenDeleted() {
        value.deletionDate = now
        XCTAssertTrue(value.hasBeenDeleted)
    }

    func testHasBeenDeletedInFuture() {
        value.deletionDate = now.addingTimeInterval(86400)
        XCTAssertFalse(value.hasBeenDeleted)
    }

    func testHasNotBeenDeleted() {
        value.deletionDate = nil
        XCTAssertFalse(value.hasBeenDeleted)
    }

    func testMarkAsDeleted() {
        value.deletionDate = nil
        XCTAssertFalse(value.hasBeenDeleted)
        value.markAsDeleted()
        XCTAssertTrue(value.hasBeenDeleted)
    }
}

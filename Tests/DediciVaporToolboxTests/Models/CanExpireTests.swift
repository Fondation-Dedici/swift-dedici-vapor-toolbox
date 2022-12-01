//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTVapor
@testable import DediciVaporToolbox

internal final class CanExpireTests: XCTestCase {
    struct ModelMock: CanExpire {
        var expirationDate: Date?
    }

    var value = ModelMock()
    let now = Date()

    func testHasExpired() {
        value.expirationDate = now
        XCTAssertTrue(value.hasExpired)
    }

    func testHasExpiredInFuture() {
        value.expirationDate = now.addingTimeInterval(86400)
        XCTAssertFalse(value.hasExpired)
    }

    func testHasNotExpired() {
        value.expirationDate = nil
        XCTAssertFalse(value.hasExpired)
    }

    func testMarkAsExpired() {
        value.expirationDate = nil
        XCTAssertFalse(value.hasExpired)
        value.markAsExpired()
        XCTAssertTrue(value.hasExpired)
    }
}

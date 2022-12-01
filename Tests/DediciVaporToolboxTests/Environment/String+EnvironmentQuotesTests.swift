//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import XCTVapor
@testable import DediciVaporToolbox

internal final class StringEnvironmentQuotesTests: XCTestCase {
    func testRemoveEnvironmentQuotesWithoutQuotes() {
        var string = "test"
        string.removeEnvironmentQuotes()
        XCTAssertEqual(string, "test")
    }

    func testRemoveEnvironmentQuotesWithQuotes() {
        var string = "\"test\""
        string.removeEnvironmentQuotes()
        XCTAssertEqual(string, "test")
    }

    func testRemoveEnvironmentQuotesWithOneSideQuotes() {
        var string = "\"test"
        string.removeEnvironmentQuotes()
        XCTAssertEqual(string, "\"test")
    }

    func testRemovingEnvironmentQuotesWithoutQuotes() {
        let string = "test".removingEnvironmentQuotes()
        XCTAssertEqual(string, "test")
    }

    func testRemovingEnvironmentQuotesWithQuotes() {
        let string = "\"test\"".removingEnvironmentQuotes()
        XCTAssertEqual(string, "test")
    }

    func testRemovingEnvironmentQuotesWithOneSideQuotes() {
        let string = "\"test".removingEnvironmentQuotes()
        XCTAssertEqual(string, "\"test")
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import XCTVapor
@testable import DediciVaporToolbox

internal final class StringEnvironmentInlineBase64Tests: XCTestCase {
    func testSplitEnvironmentInlineBase64WithoutSplitters() {
        var string = "VGhpcyBpcyBhIHRlc3Q="
        string.splitEnvironmentInlineBase64()
        XCTAssertEqual(string, "VGhpcyBpcyBhIHRlc3Q=")
    }

    func testSplitEnvironmentInlineBase64WithSplitters() {
        var string = "VGhpcyBp||cyBhIHRl||c3Q="
        string.splitEnvironmentInlineBase64()
        XCTAssertEqual(string, "VGhpcyBp\ncyBhIHRl\nc3Q=")
    }

    func testSplittingEnvironmentInlineBase64WithoutSplitters() {
        let string = "VGhpcyBpcyBhIHRlc3Q=".splittingEnvironmentInlineBase64()
        XCTAssertEqual(string, "VGhpcyBpcyBhIHRlc3Q=")
    }

    func testSplittingEnvironmentInlineBase64WithSplitters() {
        let string = "VGhpcyBp||cyBhIHRl||c3Q=".splittingEnvironmentInlineBase64()
        XCTAssertEqual(string, "VGhpcyBp\ncyBhIHRl\nc3Q=")
    }
}

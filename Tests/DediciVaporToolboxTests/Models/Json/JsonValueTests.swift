//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import XCTest
@testable import DediciVaporToolbox

internal final class JsonValueTests: XCTestCase {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    func testNilValue() throws {
        let jsonString = """
        {
            "value": null
        }
        """

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.object(["value": .null])

        XCTAssertEqual(jsonValue, decoded)
    }

    func testNestedNilValue() throws {
        let jsonString = """
        {
            "value": {
                "value": null
            }
        }
        """

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.object(["value": .object(["value": .null])])

        XCTAssertEqual(jsonValue, decoded)
    }

    func testArrayNilValue() throws {
        let jsonString = """
        [
            null
        ]
        """

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.array([.null])

        XCTAssertEqual(jsonValue, decoded)
    }

    func testArrayNestedNilValue() throws {
        let jsonString = """
        [
            {
                "value": null
            }
        ]
        """

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.array([.object(["value": .null])])

        XCTAssertEqual(jsonValue, decoded)
    }

    func testFragmentNumberValue() throws {
        let jsonString = "42"

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.number(42)

        XCTAssertEqual(jsonValue, decoded)
    }

    func testFragmentBoolValue() throws {
        let jsonString = "true"

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.bool(true)

        XCTAssertEqual(jsonValue, decoded)
    }

    func testFragmentStringValue() throws {
        let jsonString = "\"true\""

        let decoded = try decoder.decode(JsonValue.self, from: Data(jsonString.utf8))
        let jsonValue = JsonValue.string("true")

        XCTAssertEqual(jsonValue, decoded)
    }
}

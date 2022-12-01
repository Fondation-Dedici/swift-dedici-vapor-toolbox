//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDDataTests: XCTestCase {
    func testThrowsWhenTooMuchData() {
        XCTAssertThrowsError(try UUID(data: .init(count: UUID.size + 1)))
    }

    func testThrowsWhenNotEnoughData() {
        XCTAssertThrowsError(try UUID(data: .init(count: UUID.size - 1)))
    }

    func testNoThrowWhenDataCountIsCorrect() {
        XCTAssertNoThrow(try UUID(data: .init(count: UUID.size)))
    }

    func testInitWithData() throws {
        let data = Data([Void](repeating: (), count: UUID.size).map { UInt8.random(in: UInt8.min ... UInt8.max) })

        let uuid = try UUID(data: data)

        XCTAssertEqual(uuid.uuid.0, data[0])
        XCTAssertEqual(uuid.uuid.1, data[1])
        XCTAssertEqual(uuid.uuid.2, data[2])
        XCTAssertEqual(uuid.uuid.3, data[3])
        XCTAssertEqual(uuid.uuid.4, data[4])
        XCTAssertEqual(uuid.uuid.5, data[5])
        XCTAssertEqual(uuid.uuid.6, data[6])
        XCTAssertEqual(uuid.uuid.7, data[7])
        XCTAssertEqual(uuid.uuid.8, data[8])
        XCTAssertEqual(uuid.uuid.9, data[9])
        XCTAssertEqual(uuid.uuid.10, data[10])
        XCTAssertEqual(uuid.uuid.11, data[11])
        XCTAssertEqual(uuid.uuid.12, data[12])
        XCTAssertEqual(uuid.uuid.13, data[13])
        XCTAssertEqual(uuid.uuid.14, data[14])
        XCTAssertEqual(uuid.uuid.15, data[15])
    }

    func testDataPropertyMatchesTuple() {
        let uuid = UUID()

        XCTAssertEqual(uuid.uuid.0, uuid.data[0])
        XCTAssertEqual(uuid.uuid.1, uuid.data[1])
        XCTAssertEqual(uuid.uuid.2, uuid.data[2])
        XCTAssertEqual(uuid.uuid.3, uuid.data[3])
        XCTAssertEqual(uuid.uuid.4, uuid.data[4])
        XCTAssertEqual(uuid.uuid.5, uuid.data[5])
        XCTAssertEqual(uuid.uuid.6, uuid.data[6])
        XCTAssertEqual(uuid.uuid.7, uuid.data[7])
        XCTAssertEqual(uuid.uuid.8, uuid.data[8])
        XCTAssertEqual(uuid.uuid.9, uuid.data[9])
        XCTAssertEqual(uuid.uuid.10, uuid.data[10])
        XCTAssertEqual(uuid.uuid.11, uuid.data[11])
        XCTAssertEqual(uuid.uuid.12, uuid.data[12])
        XCTAssertEqual(uuid.uuid.13, uuid.data[13])
        XCTAssertEqual(uuid.uuid.14, uuid.data[14])
        XCTAssertEqual(uuid.uuid.15, uuid.data[15])
    }
}

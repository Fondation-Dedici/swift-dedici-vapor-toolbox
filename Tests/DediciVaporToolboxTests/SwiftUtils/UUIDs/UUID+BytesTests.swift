//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTest
@testable import DediciVaporToolbox

public class UUIDBytesTests: XCTestCase {
    func testThrowsWhenTooMuchBytes() {
        XCTAssertThrowsError(try UUID(bytes: .init(repeating: 0x00, count: UUID.size + 1)))
    }

    func testThrowsWhenNotEnoughBytes() {
        XCTAssertThrowsError(try UUID(bytes: .init(repeating: 0x00, count: UUID.size - 1)))
    }

    func testNoThrowWhenBytesCountIsCorrect() {
        XCTAssertNoThrow(try UUID(bytes: .init(repeating: 0x00, count: UUID.size)))
    }

    func testInitWithBytes() throws {
        let bytes = [Void](repeating: (), count: UUID.size)
            .map { UInt8.random(in: UInt8.min ... UInt8.max) }

        let uuid = try UUID(bytes: bytes)

        XCTAssertEqual(uuid.uuid.0, bytes[0])
        XCTAssertEqual(uuid.uuid.1, bytes[1])
        XCTAssertEqual(uuid.uuid.2, bytes[2])
        XCTAssertEqual(uuid.uuid.3, bytes[3])
        XCTAssertEqual(uuid.uuid.4, bytes[4])
        XCTAssertEqual(uuid.uuid.5, bytes[5])
        XCTAssertEqual(uuid.uuid.6, bytes[6])
        XCTAssertEqual(uuid.uuid.7, bytes[7])
        XCTAssertEqual(uuid.uuid.8, bytes[8])
        XCTAssertEqual(uuid.uuid.9, bytes[9])
        XCTAssertEqual(uuid.uuid.10, bytes[10])
        XCTAssertEqual(uuid.uuid.11, bytes[11])
        XCTAssertEqual(uuid.uuid.12, bytes[12])
        XCTAssertEqual(uuid.uuid.13, bytes[13])
        XCTAssertEqual(uuid.uuid.14, bytes[14])
        XCTAssertEqual(uuid.uuid.15, bytes[15])
    }

    func testBytesPropertyMatchesTuple() {
        let uuid = UUID()

        XCTAssertEqual(uuid.uuid.0, uuid.bytes[0])
        XCTAssertEqual(uuid.uuid.1, uuid.bytes[1])
        XCTAssertEqual(uuid.uuid.2, uuid.bytes[2])
        XCTAssertEqual(uuid.uuid.3, uuid.bytes[3])
        XCTAssertEqual(uuid.uuid.4, uuid.bytes[4])
        XCTAssertEqual(uuid.uuid.5, uuid.bytes[5])
        XCTAssertEqual(uuid.uuid.6, uuid.bytes[6])
        XCTAssertEqual(uuid.uuid.7, uuid.bytes[7])
        XCTAssertEqual(uuid.uuid.8, uuid.bytes[8])
        XCTAssertEqual(uuid.uuid.9, uuid.bytes[9])
        XCTAssertEqual(uuid.uuid.10, uuid.bytes[10])
        XCTAssertEqual(uuid.uuid.11, uuid.bytes[11])
        XCTAssertEqual(uuid.uuid.12, uuid.bytes[12])
        XCTAssertEqual(uuid.uuid.13, uuid.bytes[13])
        XCTAssertEqual(uuid.uuid.14, uuid.bytes[14])
        XCTAssertEqual(uuid.uuid.15, uuid.bytes[15])
    }
}

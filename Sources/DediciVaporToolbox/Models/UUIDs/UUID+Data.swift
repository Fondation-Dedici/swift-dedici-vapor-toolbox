//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUID {
    public var data: Data {
        Data(bytes: bytes, count: bytes.count)
    }

    public init(data: Data) throws {
        guard !(data.count > Self.size) else { throw SizeError.tooMuchBytes }
        guard !(data.count < Self.size) else { throw SizeError.notEnoughBytes }

        self = UUID(uuid: (
            data[0],
            data[1],
            data[2],
            data[3],
            data[4],
            data[5],
            data[6],
            data[7],
            data[8],
            data[9],
            data[10],
            data[11],
            data[12],
            data[13],
            data[14],
            data[15]
        ))
    }
}

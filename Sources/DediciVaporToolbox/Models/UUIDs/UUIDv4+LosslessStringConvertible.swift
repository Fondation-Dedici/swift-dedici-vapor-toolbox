//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension UUIDv4: LosslessStringConvertible {
    public init?(_ description: String) {
        guard let uuid = UUID(uuidString: description) else { return nil }
        guard let uuidV4 = try? UUIDv4(value: uuid) else { return nil }
        self = uuidV4
    }

    public var description: String { value.uuidString }
}

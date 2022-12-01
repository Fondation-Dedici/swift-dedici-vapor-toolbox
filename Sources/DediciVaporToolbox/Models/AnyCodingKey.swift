//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct AnyCodingKey: CodingKey {
    public var stringValue: String
    public var intValue: Int?

    public init(_ string: String) {
        self.stringValue = string
        self.intValue = nil
    }

    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    public init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
}

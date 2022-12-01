//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

extension Data {
    public enum HexadecimalParsingError: Error {
        case charactersCountIsNotEven
        case invalidCharacters
    }

    public enum HexadecimalCase: String, Hashable, Codable {
        case lower
        case upper
    }

    public func decodeString(usingEncoding encoding: String.Encoding = .utf8) -> String? {
        String(data: self, encoding: encoding)
    }

    public func asHexadecimalString(case: HexadecimalCase = .upper) -> String {
        let format: String
        switch `case` {
        case .upper: format = "%02hhX"
        case .lower: format = "%02hhx"
        }
        return map { String(format: format, $0) }.joined()
    }

    public init(randomBytes size: Int) {
        self.init([Void](repeating: (), count: size).map { UInt8.random(in: .min ... .max) })
    }
}

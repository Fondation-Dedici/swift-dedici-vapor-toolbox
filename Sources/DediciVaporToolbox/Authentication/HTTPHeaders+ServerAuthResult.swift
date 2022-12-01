//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders {
    /// NX-Server-Auth-Result header.
    public var nxServerAuthResult: ServerAuthResult? {
        get {
            guard
                let data = first(name: .nxServerAuthResult).flatMap({ Data(base64Encoded: $0) }),
                let result = try? ContentConfiguration.jsonDecoder.decode(ServerAuthResult.self, from: data)
            else { return nil }

            return result
        }
        set {
            remove(name: .nxServerAuthResult)
            if let data = newValue.flatMap({ try? ContentConfiguration.jsonEncoder.encode($0) }) {
                replaceOrAdd(name: .nxServerAuthResult, value: data.base64EncodedString())
            }
        }
    }
}

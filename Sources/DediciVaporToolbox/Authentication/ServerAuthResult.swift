//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct ServerAuthResult: Hashable, Content, Authenticatable {
    public let userId: UUIDv4
    public let sessionId: UUIDv4
    public let subaccounts: [UUIDv4]?
    public let extraAuth: JsonObject?

    public init(
        userId: UUIDv4,
        sessionId: UUIDv4,
        subaccounts: [UUIDv4]? = nil,
        extraAuth: JsonObject? = nil
    ) {
        self.userId = userId
        self.sessionId = sessionId
        self.subaccounts = subaccounts
        self.extraAuth = extraAuth
    }
}

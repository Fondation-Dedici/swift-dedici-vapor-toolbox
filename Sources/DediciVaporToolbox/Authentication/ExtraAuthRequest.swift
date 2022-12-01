//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct ExtraAuthRequest<T: Hashable & Content>: Hashable, Content {
    public let userId: UUIDv4
    public let content: T

    public init(userId: UUIDv4, content: T) {
        self.userId = userId
        self.content = content
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct ExtraAuthResponse<T: Hashable & Content>: Hashable, Content {
    public let id: UUIDv4
    public let content: T

    public init(id: UUIDv4, content: T) {
        self.id = id
        self.content = content
    }
}

//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public protocol CanExpire {
    var expirationDate: Date? { get set }
    var hasExpired: Bool { get }

    mutating func markAsExpired() throws
}

extension CanExpire {
    public var hasExpired: Bool {
        guard let date = expirationDate else { return false }
        return date.timeIntervalSinceNow <= 0
    }

    public mutating func markAsExpired() {
        guard !hasExpired else { return }
        expirationDate = .init()
    }
}

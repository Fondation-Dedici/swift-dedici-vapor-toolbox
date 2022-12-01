//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public protocol CanBeDeleted {
    var deletionDate: Date? { get set }
    var hasBeenDeleted: Bool { get }

    mutating func markAsDeleted() throws
}

extension CanBeDeleted {
    public var hasBeenDeleted: Bool {
        guard let date = deletionDate else { return false }
        return date.timeIntervalSinceNow <= 0
    }

    public mutating func markAsDeleted() {
        guard !hasBeenDeleted else { return }
        deletionDate = .init()
    }
}

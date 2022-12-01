//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public protocol CanBeDisabled {
    var disablingDate: Date? { get set }
    var hasBeenDisabled: Bool { get }

    mutating func markAsDisabled() throws
}

extension CanBeDisabled {
    public var hasBeenDisabled: Bool {
        guard let date = disablingDate else { return false }
        return date.timeIntervalSinceNow <= 0
    }

    public mutating func markAsDisabled() {
        guard !hasBeenDisabled else { return }
        disablingDate = .init()
    }
}

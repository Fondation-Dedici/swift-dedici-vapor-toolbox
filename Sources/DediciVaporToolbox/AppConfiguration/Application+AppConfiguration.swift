//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension Application {
    @discardableResult
    public func apply(_ configuration: AppConfiguration) throws -> Self {
        try configuration.configure(self)
        return self
    }
}

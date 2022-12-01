//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders {
    /// NX-Server-Time-Start header.
    public var nxServerTimeStart: Date? {
        get {
            first(name: .nxServerTimeStart)
                .flatMap(TimeInterval.init)
                .flatMap(Date.init(timeIntervalSince1970:))
        }
        set {
            remove(name: .nxServerTimeStart)
            newValue
                .flatMap { replaceOrAdd(name: .nxServerTimeStart, value: String($0.timeIntervalSince1970)) }
        }
    }

    /// NX-Server-Time-End header.
    public var nxServerTimeEnd: Date? {
        get {
            first(name: .nxServerTimeEnd)
                .flatMap(TimeInterval.init)
                .flatMap(Date.init(timeIntervalSince1970:))
        }
        set {
            remove(name: .nxServerTimeEnd)
            newValue
                .flatMap { replaceOrAdd(name: .nxServerTimeEnd, value: String($0.timeIntervalSince1970)) }
        }
    }
}

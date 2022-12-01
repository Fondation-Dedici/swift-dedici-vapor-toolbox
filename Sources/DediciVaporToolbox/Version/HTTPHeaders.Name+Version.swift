//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders {
    /// NX-Version header.
    public var nxVersion: UInt32? {
        get {
            first(name: .nxVersion)
                .flatMap(UInt32.init)
        }
        set {
            remove(name: .nxVersion)
            newValue
                .flatMap(String.init)
                .flatMap { replaceOrAdd(name: .nxVersion, value: $0) }
        }
    }

    /// NX-Version-Current header.
    public var nxVersionCurrent: UInt32? {
        get {
            first(name: .nxVersionCurrent)
                .flatMap(UInt32.init)
        }
        set {
            remove(name: .nxVersionCurrent)
            newValue
                .flatMap(String.init)
                .flatMap { replaceOrAdd(name: .nxVersionCurrent, value: $0) }
        }
    }

    /// NX-Version-Deprecated header.
    public var nxVersionDeprecated: UInt32? {
        get {
            first(name: .nxVersionDeprecated)
                .flatMap(UInt32.init)
        }
        set {
            remove(name: .nxVersionDeprecated)
            newValue
                .flatMap(String.init)
                .flatMap { replaceOrAdd(name: .nxVersionDeprecated, value: $0) }
        }
    }

    /// NX-Version-Minimum header.
    public var nxVersionMinimum: UInt32? {
        get {
            first(name: .nxVersionMinimum)
                .flatMap(UInt32.init)
        }
        set {
            remove(name: .nxVersionMinimum)
            newValue
                .flatMap(String.init)
                .flatMap { replaceOrAdd(name: .nxVersionMinimum, value: $0) }
        }
    }

    /// NX-Version-Status header.
    public var nxVersionStatus: VersionStatus? {
        get { first(name: .nxVersionStatus).flatMap(VersionStatus.init) }
        set {
            remove(name: .nxVersionStatus)
            newValue
                .flatMap { replaceOrAdd(name: .nxVersionStatus, value: $0.rawValue) }
        }
    }
}

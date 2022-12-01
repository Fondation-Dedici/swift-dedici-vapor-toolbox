//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders.Name {
    /// NX-Version header.
    public static let nxVersion = HTTPHeaders.Name("NX-Version")
    /// NX-Version-Current header.
    public static let nxVersionCurrent = HTTPHeaders.Name("NX-Version-Current")
    /// NX-Version-Deprecated header.
    public static let nxVersionDeprecated = HTTPHeaders.Name("NX-Version-Deprecated")
    /// NX-Version-Minimum header.
    public static let nxVersionMinimum = HTTPHeaders.Name("NX-Version-Minimum")
    /// NX-Version-Status header.
    public static let nxVersionStatus = HTTPHeaders.Name("NX-Version-Status")
}

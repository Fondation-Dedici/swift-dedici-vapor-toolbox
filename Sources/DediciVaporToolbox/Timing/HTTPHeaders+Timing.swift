//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

extension HTTPHeaders.Name {
    /// NX-Server-Time-Start header.
    public static let nxServerTimeStart = HTTPHeaders.Name("NX-Server-Time-Start")
    /// NX-Server-Time-End header.
    public static let nxServerTimeEnd = HTTPHeaders.Name("NX-Server-Time-End")
}

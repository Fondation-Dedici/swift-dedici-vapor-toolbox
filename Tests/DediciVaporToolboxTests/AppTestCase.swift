//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTVapor
@testable import DediciVaporToolbox

internal class AppTestCase: XCTestCase {
    let app = Application(.testing)

    override func tearDown() {
        super.tearDown()

        app.shutdown()
    }
}

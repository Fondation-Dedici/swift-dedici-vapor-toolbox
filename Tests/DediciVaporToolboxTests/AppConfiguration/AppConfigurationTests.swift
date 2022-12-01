//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import XCTVapor
@testable import DediciVaporToolbox

internal final class AppConfigurationTests: AppTestCase {
    private struct ConfigurationMock: AppConfiguration {
        let responseMockContent = UUID().uuidString
        let requestMockPath = UUID().uuidString

        func configure(_ application: Application) {
            application.get(.constant(requestMockPath)) { _ in self.responseMockContent }
        }
    }

    func testApply() throws {
        let config = ConfigurationMock()

        try app.test(.GET, config.requestMockPath, afterResponse: { response in
            XCTAssertEqual(response.status, .notFound)
        })

        try app.apply(config)

        try app.test(.GET, config.requestMockPath, afterResponse: { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string, config.responseMockContent)
        })
    }
}

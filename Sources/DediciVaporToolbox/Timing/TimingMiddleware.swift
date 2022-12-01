//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public struct TimingMiddleware: Middleware {
    public init() {}

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        let start = Date()
        return next.respond(to: request)
            .map { response in
                response.headers.nxServerTimeStart = start
                response.headers.nxServerTimeEnd = Date()
                return response
            }
    }
}

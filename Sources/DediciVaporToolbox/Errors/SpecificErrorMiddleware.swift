//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public class SpecificErrorMiddleware: Middleware {
    public init() {}

    private func response(from error: Error, considering _: Request) throws -> Response {
        guard let specificError = error as? SpecificError else { throw error }

        var headers = specificError.headers
        headers.nxErrorCode = specificError.headerCode

        return Response(
            status: specificError.status,
            headers: headers,
            body: try specificError.body()
        )
    }

    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        next.respond(to: request)
            .flatMapErrorThrowing { error in
                try self.response(from: error, considering: request)
            }
    }
}

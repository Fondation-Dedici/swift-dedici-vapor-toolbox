//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation
import Vapor

public protocol SpecificError: Error {
    var rawValue: String { get }
    var headerCode: String { get }
    var headers: HTTPHeaders { get }
    var status: HTTPResponseStatus { get }

    func body() throws -> Response.Body
}

extension SpecificError {
    public var headerCode: String { rawValue }
    public var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        headers.contentType = .json
        return headers
    }

    public var status: HTTPResponseStatus { .badRequest }

    public func body() throws -> Response.Body { .empty }
}

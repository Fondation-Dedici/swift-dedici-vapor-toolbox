//
// Copyright (c) 2022 Dediĉi
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public enum JsonValue: Hashable {
    case null
    case bool(JsonBool)
    case number(JsonNumber)
    case string(JsonString)
    case array(JsonArray)
    case object(JsonObject)
}

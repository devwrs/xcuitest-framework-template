// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import Foundation

enum TestConfig {
    static let bundleId = Environment.string(.bundleId, default: "com.example.app")
    static let language = Environment.string(.language, default: "en")
    static let locale = Environment.string(.locale, default: "en_US")
    static let useMocks = Environment.bool(.useMocks, default: true)
    static let resetKeychain = Environment.bool(.resetKeychain, default: true)
}

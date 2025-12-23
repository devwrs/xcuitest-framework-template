// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import Foundation

enum EnvironmentKey: String {
    case bundleId = "UITEST_BUNDLE_ID"
    case language = "UITEST_LANGUAGE"
    case locale = "UITEST_LOCALE"
    case useMocks = "UITEST_USE_MOCKS"
    case resetKeychain = "UITEST_RESET_KEYCHAIN"
}

enum Environment {
    static func string(_ key: EnvironmentKey, default defaultValue: String) -> String {
        ProcessInfo.processInfo.environment[key.rawValue] ?? defaultValue
    }

    static func bool(_ key: EnvironmentKey, default defaultValue: Bool) -> Bool {
        let raw = ProcessInfo.processInfo.environment[key.rawValue]
        guard let value = raw?.lowercased() else { return defaultValue }
        if value == "1" || value == "true" || value == "yes" { return true }
        if value == "0" || value == "false" || value == "no" { return false }
        return defaultValue
    }
}

// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import Foundation

enum LaunchArgument {
    static let uiTesting = "-ui-testing"
    static let resetKeychain = "-reset-keychain"
    static let useMocks = "-use-mocks"
    static let loggedIn = "-logged-in"
}

enum LaunchArguments {
    static func defaultArguments(isLoggedIn: Bool) -> [String] {
        var args = [LaunchArgument.uiTesting]
        if TestConfig.resetKeychain { args.append(LaunchArgument.resetKeychain) }
        if TestConfig.useMocks { args.append(LaunchArgument.useMocks) }
        if isLoggedIn { args.append(LaunchArgument.loggedIn) }
        return args
    }

    static var environmentOverrides: [String: String] {
        [
            EnvironmentKey.language.rawValue: TestConfig.language,
            EnvironmentKey.locale.rawValue: TestConfig.locale
        ]
    }
}

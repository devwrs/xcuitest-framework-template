// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

final class App {
    let raw: XCUIApplication

    init(bundleId: String = TestConfig.bundleId) {
        raw = XCUIApplication(bundleIdentifier: bundleId)
    }

    func launch(isLoggedIn: Bool = false) {
        raw.launchArguments = LaunchArguments.defaultArguments(isLoggedIn: isLoggedIn)
        raw.launchEnvironment = LaunchArguments.environmentOverrides
        raw.launch()
    }

    func terminate() {
        raw.terminate()
    }
}

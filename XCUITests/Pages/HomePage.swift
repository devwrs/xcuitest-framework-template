// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

struct HomePage {
    let app: XCUIApplication

    var title: XCUIElement { app.staticTexts[AccessibilityId.homeTitle] }

    func waitForReady() {
        Wait.forExistence(title)
    }
}

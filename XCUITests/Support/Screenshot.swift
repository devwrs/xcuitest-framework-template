// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

enum Screenshot {
    static func capture(app: XCUIApplication, name: String) -> XCTAttachment {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        return attachment
    }
}

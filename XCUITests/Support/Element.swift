// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

extension XCUIElement {
    func clearAndType(_ text: String) {
        tap()
        if let current = value as? String, !current.isEmpty {
            let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: current.count)
            typeText(deleteString)
        }
        typeText(text)
    }
}

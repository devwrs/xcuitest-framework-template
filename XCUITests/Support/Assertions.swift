// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

enum Assertions {
    static func assertExists(_ element: XCUIElement, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertTrue(element.exists, "Expected element to exist", file: file, line: line)
    }

    static func assertHittable(_ element: XCUIElement, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertTrue(element.isHittable, "Expected element to be hittable", file: file, line: line)
    }

    static func assertLabel(_ element: XCUIElement, equals expected: String, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(element.label, expected, "Unexpected label", file: file, line: line)
    }
}

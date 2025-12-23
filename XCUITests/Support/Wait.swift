// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

enum Wait {
    @discardableResult
    static func forExistence(_ element: XCUIElement, timeout: TimeInterval = 10, file: StaticString = #filePath, line: UInt = #line) -> Bool {
        let exists = element.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists, "Element did not exist in time", file: file, line: line)
        return exists
    }

    @discardableResult
    static func forHittable(_ element: XCUIElement, timeout: TimeInterval = 10, file: StaticString = #filePath, line: UInt = #line) -> Bool {
        let predicate = NSPredicate(format: "exists == true && hittable == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, .completed, "Element was not hittable in time", file: file, line: line)
        return result == .completed
    }
}

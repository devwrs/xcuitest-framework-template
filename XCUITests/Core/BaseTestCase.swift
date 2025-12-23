// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

class BaseTestCase: XCTestCase {
    var app: App!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = App()
        app.launch()
    }

    override func tearDownWithError() throws {
        if let run = testRun, !run.hasSucceeded {
            let attachment = Screenshot.capture(app: app.raw, name: name)
            add(attachment)
        }
        app.terminate()
    }
}

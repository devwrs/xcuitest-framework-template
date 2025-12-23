// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

struct LoginFlow {
    let app: XCUIApplication

    func login(email: String, password: String) -> HomePage {
        let login = LoginPage(app: app)
        login.waitForReady()
        login.login(email: email, password: password)

        let home = HomePage(app: app)
        home.waitForReady()
        return home
    }
}

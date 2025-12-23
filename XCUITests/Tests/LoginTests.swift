// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

final class LoginTests: BaseTestCase {
    func test_login_withValidCredentials_showsHome() {
        let home = LoginFlow(app: app.raw)
            .login(email: "test@example.com", password: "password123")
        Assertions.assertExists(home.title)
    }
}

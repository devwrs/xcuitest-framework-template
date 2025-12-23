// Copyright (c) 2025 Robin Singh
// SPDX-License-Identifier: MIT

import XCTest

struct LoginPage {
    let app: XCUIApplication

    var emailField: XCUIElement { app.textFields[AccessibilityId.loginEmailField] }
    var passwordField: XCUIElement { app.secureTextFields[AccessibilityId.loginPasswordField] }
    var signInButton: XCUIElement { app.buttons[AccessibilityId.loginButton] }

    func waitForReady() {
        Wait.forExistence(emailField)
    }

    func login(email: String, password: String) {
        emailField.clearAndType(email)
        passwordField.clearAndType(password)
        signInButton.tap()
    }
}

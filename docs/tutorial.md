<!-- Copyright (c) 2025 Robin Singh. SPDX-License-Identifier: MIT -->

# Tutorial: XCUITest + This Framework

This tutorial teaches XCUITest basics and how to use this framework. It’s designed
so you can start with a smoke test and grow into robust suites.

## 1) XCUITest Basics (5 minutes)

### What XCUITest Does
XCUITest drives your app like a user would: it launches the app, finds UI elements,
performs actions, and asserts expected results.

### Core Types You’ll See
- `XCUIApplication`: the app under test.
- `XCUIElement`: a UI element (button, text field, etc.).
- `XCTestCase`: a test class containing test methods.

### A Minimal Example
```swift
func test_example() {
    let app = XCUIApplication()
    app.launch()

    let loginButton = app.buttons["login.submit"]
    XCTAssertTrue(loginButton.exists)
    loginButton.tap()
}
```

## 2) Framework Concepts (10 minutes)

This framework wraps XCUITest with structure and best practices:

- **Pages**: page objects that define elements and actions for a screen.
- **Flows**: multi-step user journeys (e.g., login).
- **Tests**: thin orchestration + assertions.
- **Support**: waits, assertions, screenshot helpers, and accessibility IDs.
- **Config/Core**: launch arguments, environment, app wrapper, and base test case.

Dependency direction:
```
Tests -> Flows -> Pages -> Support
```

## 3) One-Time Setup (10 minutes)

1. Add `XCUITests/` files to your app’s UI test target.
2. Update the bundle id in `XCUITests/Config/TestConfig.swift`.
3. Replace sample accessibility IDs in `XCUITests/Support/Accessibility.swift`.
4. Ensure your app sets those accessibility identifiers on UI elements.

## 4) Add Your First Test (15 minutes)

### Step A: Create a Page Object
Add a page for the screen under test.

```swift
// XCUITests/Pages/ProfilePage.swift
import XCTest

struct ProfilePage {
    let app: XCUIApplication

    var title: XCUIElement { app.staticTexts["profile.title"] }
    var editButton: XCUIElement { app.buttons["profile.edit"] }

    func waitForReady() {
        Wait.forExistence(title)
    }
}
```

### Step B: Create a Flow (optional but recommended)
```swift
// XCUITests/Flows/ProfileFlow.swift
import XCTest

struct ProfileFlow {
    let app: XCUIApplication

    func openProfile() -> ProfilePage {
        let home = HomePage(app: app)
        home.waitForReady()
        app.buttons["home.profile"].tap()

        let profile = ProfilePage(app: app)
        profile.waitForReady()
        return profile
    }
}
```

### Step C: Add a Test
```swift
// XCUITests/Tests/ProfileTests.swift
import XCTest

final class ProfileTests: BaseTestCase {
    func test_profile_opens() {
        let profile = ProfileFlow(app: app.raw).openProfile()
        Assertions.assertExists(profile.title)
    }
}
```

## 5) Running Tests (5 minutes)

```bash
DEVICE_UDID=<udid> ./scripts/prep_simulator.sh
./scripts/run_xcuitests.sh -scheme YourApp -testplan Smoke -workspace YourApp.xcworkspace
```

## 6) Best Practices (quick hits)

- **Stability**: Always wait for elements using `Wait.forExistence`.
- **Access**: Prefer accessibility identifiers over labels.
- **Isolation**: Use launch args/env for deterministic data.
- **Speed**: Keep smoke tests fast and independent.
- **Debugging**: Screenshot on failure is automatic in `BaseTestCase`.

## 7) What to Learn Next

- Apple XCTest docs: XCTestCase, expectations, and UI testing.
- Element queries: predicates and `descendants(matching:)`.
- Test plans: split smoke/regression suites.
- CI reporting with `xcresult` bundles.

## 8) Common Pitfalls

- Missing accessibility IDs → flaky or unfindable elements.
- Relying on labels → breaks on localization.
- Not waiting for animations → random failures.
- Shared state between tests → hard to debug failures.

## 9) Cheatsheet

- **Wait for element:** `Wait.forExistence(element)`
- **Assert visible:** `Assertions.assertHittable(element)`
- **Screenshot on failure:** automatic in `BaseTestCase`
- **Launch options:** `XCUITests/Core/LaunchArguments.swift`


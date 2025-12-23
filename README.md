<!-- Copyright (c) 2025 Robin Singh. SPDX-License-Identifier: MIT -->

# XCUITest Framework Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
![Platform: iOS](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![Tests: XCUITest](https://img.shields.io/badge/tests-XCUITest-blue.svg)

Industry-standard XCUITest framework layout for iOS apps. This repo is a template:
integrate the `XCUITests/` folder into your app's UI test target (or copy files into
your existing UI test target) and adjust names to match your app.

## Table of Contents
- Overview
- Goals
- Structure
- Quick Start
- Configuration
- Running Tests
- CI
- Documentation
- License
- Author

## Overview
This framework separates tests, flows, page objects, and support utilities to keep UI
tests stable, readable, and CI-friendly.

## Goals
- Deterministic, stable UI tests
- Clear separation of tests, pages, flows, and support code
- Minimal test boilerplate and strong reuse
- CI-friendly execution and reporting

## Structure
```
XCUITests/
  Config/
    TestConfig.swift
  Core/
    App.swift
    BaseTestCase.swift
    LaunchArguments.swift
  Flows/
    LoginFlow.swift
  Pages/
    HomePage.swift
    LoginPage.swift
  Support/
    Accessibility.swift
    Assertions.swift
    Element.swift
    Screenshot.swift
    Wait.swift
  Tests/
    LoginTests.swift
TestPlans/
  Smoke.xctestplan
scripts/
  run_xcuitests.sh
  prep_simulator.sh
```

## Quick Start
1. Add the files under `XCUITests/` to your app's UI test target.
2. Rename the test target in `TestPlans/Smoke.xctestplan` if needed.
3. Update bundle identifiers and launch arguments in `XCUITests/Config/TestConfig.swift`.
4. Run tests with `scripts/run_xcuitests.sh` or from Xcode.

## Configuration
- Update bundle identifiers, language, and locale in `XCUITests/Config/TestConfig.swift`.
- Adjust launch arguments and environment overrides in `XCUITests/Core/LaunchArguments.swift`.
- Replace sample accessibility identifiers in `XCUITests/Support/Accessibility.swift`.

## Running Tests
```
DEVICE_UDID=<udid> ./scripts/prep_simulator.sh
./scripts/run_xcuitests.sh -scheme YourApp -testplan Smoke -workspace YourApp.xcworkspace
```

## CI
- Prefer `xcodebuild` with `-resultBundlePath` for reporting.
- Use a fixed simulator name and OS version to reduce variance.
- GitHub Actions workflow template: `.github/workflows/xcuitest.yml`.

## Documentation
- `docs/architecture.md`
- `docs/standards.md`
- `docs/ci.md`
- `docs/tutorial.md`

## License
This project is open source under the MIT License. See `LICENSE`.

## Author
Robin Singh

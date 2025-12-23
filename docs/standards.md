<!-- Copyright (c) 2025 Robin Singh. SPDX-License-Identifier: MIT -->

# Standards

## Naming
- Test classes: `FeatureTests` (e.g., `LoginTests`)
- Test methods: `test_login_withValidCredentials_showsHome()`
- Page objects: `FeaturePage` (e.g., `LoginPage`)
- Flow objects: `FeatureFlow` (e.g., `LoginFlow`)

## Assertions
- Use single, focused assertions per test step.
- Prefer custom assert helpers from `Support/Assertions.swift`.

## Waits
- Always wait for elements before interaction.
- Use `Wait.forExistence` or `Wait.forHittable` helpers.

## Accessibility
- All UI elements must have stable accessibility identifiers.
- Use `AccessibilityId` constants for reference.

## Test Scope
- Smoke: critical flows only, no external dependencies.
- Regression: broader coverage with more data setup.
- Use test plans to segment.

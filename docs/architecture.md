<!-- Copyright (c) 2025 Robin Singh. SPDX-License-Identifier: MIT -->

# Architecture

## Core Concepts
- BaseTestCase: common setup, launch, and teardown behavior
- App: single entry point for app-specific queries and navigation helpers
- Pages: UI element definitions and page-level actions
- Flows: reusable user journeys that combine page interactions
- Tests: minimal orchestration and assertions

## Dependency Direction
Tests -> Flows -> Pages -> Support

No back references from Pages/Support to Tests or Flows.

## App Launch Strategy
- All app launch configuration lives in `TestConfig` and `LaunchArguments`.
- Tests only specify the scenario they need (e.g., logged in vs. logged out).

## Stability Practices
- Centralized wait utilities for existence and hittability
- Assertions only in tests (or in Support helpers used by tests)
- Accessibility identifiers required for all stable element access

## Reporting
- Screenshots taken on failure in BaseTestCase
- Prefer `xcodebuild -resultBundlePath` in CI

## Data Strategy
- Use launch arguments or environment variables to seed data when possible.
- Avoid server dependence for smoke tests; use deterministic test data.

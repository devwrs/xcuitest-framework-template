<!-- Copyright (c) 2025 Robin Singh. SPDX-License-Identifier: MIT -->

# CI Guidance

## xcodebuild Example
```
xcodebuild \
  -scheme YourApp \
  -testPlan Smoke \
  -destination "platform=iOS Simulator,name=iPhone 15,OS=17.5" \
  -resultBundlePath build/xcuitest-results \
  test
```

## Best Practices
- Use a dedicated simulator name and OS version.
- Keep smoke tests deterministic and fast.
- Store result bundles as CI artifacts for debugging.

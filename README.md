# EsaSwift

[![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://swift.org)

esa API client for Swift

# Installation
- via Swift Package Manager
```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/alice02/EsaSwift.git"),
    ]
)
```

# Usage
## Example
```swift
import EsaSwift

let client = EsaClient(access_token: "<access_token>", current_team: "<current_team>")

print(client.user())
```

## Methods
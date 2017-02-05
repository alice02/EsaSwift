import PackageDescription

let package = Package(
    name: "esa_swift",
    dependencies: [
      .Package(url: "https://github.com/Zewo/HTTPClient.git", majorVersion: 0, minor: 14)
    ]
)

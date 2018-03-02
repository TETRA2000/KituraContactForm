// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraContactForm",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.2.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMinor(from: "1.7.1")),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", .upToNextMinor(from: "7.0.0")),
      .package(url: "https://github.com/IBM-Swift/Configuration.git", .upToNextMinor(from: "3.0.0")),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.2.1"),
      .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
      .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", .upToNextMinor(from: "1.0.0")),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", .upToNextMinor(from: "0.0.1")),
      .package(url: "https://github.com/IBM-Swift/Swift-Kuery.git", .branch("master")),
      .package(url: "https://github.com/IBM-Swift/Kitura-MustacheTemplateEngine.git", .upToNextMajor(from: "1.7.3")),
      .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", .upToNextMajor(from: "1.8.5")),
      // 
    ],
    targets: [
      .target(name: "KituraContactForm", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger"]),
      .target(name: "Application", dependencies: ["Kitura", "Configuration", "CloudEnvironment","SwiftMetrics","Health", "SwiftKueryORM", "SwiftKueryMySQL", "KituraStencil", "KituraMustache"]),
      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ])
    ]
)

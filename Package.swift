// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "swift-graphql-todoapi",
    platforms: [
       .macOS(.v12)
    ],
    dependencies: [
        // Vapor Utilitiess
        .package(
          url: "https://github.com/alexsteinerde/graphql-kit.git",
          from: "2.0.0"
        ),
        // Web Query Page
        .package(
          url: "https://github.com/alexsteinerde/graphiql-vapor.git",
          from: "2.0.0"
        ),
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.83.1"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        // 🪶 Fluent driver for SQLite.
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "GraphQLKit", package: "graphql-kit"),
                .product(name: "GraphiQLVapor", package: "graphiql-vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),

            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Fluent", package: "Fluent"),
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
        ])
    ]
)

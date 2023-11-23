# Swift GraphQL Todo API

[article guide](https://www.kodeco.com/21148796-graphql-tutorial-for-server-side-swift-with-vapor-getting-started?page=2)

# Packages
 ```swift
    .package(
      url: "https://github.com/alexsteinerde/graphql-kit.git",
      from: "2.0.0"
    ),
    .package(
      url: "https://github.com/alexsteinerde/graphiql-vapor.git",
      from: "2.0.0"
    ),
 ```
                
 ```swift
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
 ```

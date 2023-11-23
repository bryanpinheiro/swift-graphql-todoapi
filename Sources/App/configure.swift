import NIOSSL
import Fluent
import FluentSQLiteDriver
import GraphQLKit
import GraphiQLVapor
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateTodo())
    try await app.autoMigrate()
    
    // Register the schema and its resolver.
    app.register(graphQLSchema: schema, withResolver: Resolver())

    // Enable GraphiQL web page to send queries to the GraphQL endpoint.
    if !app.environment.isRelease {
        app.enableGraphiQL()
    }
}

import Fluent

struct AddColumnCompletedToTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("todos")
            .field("completed", .bool, .required)
            .update()
    }

    func revert(on database: Database) async throws {
        try await database.schema("todos")
            .deleteField("completed")
            .update()
    }
}

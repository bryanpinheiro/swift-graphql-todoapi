import Graphiti
import Vapor

final class Resolver {
    
    func getAllTodos(
        request: Request,
        arguments: NoArguments
    ) throws -> EventLoopFuture<[Todo]> {
        Todo.query(on: request.db).all()
    }
    
    struct GetTodoArguments: Codable {
        let id: UUID
    }
    
    func getTodo(
        request: Request,
        arguments: GetTodoArguments
    ) throws -> EventLoopFuture<Todo> {
        Todo.find(arguments.id, on: request.db)
            .unwrap(or: Abort(.notFound))
    }

    struct CreateTodoArguments: Codable {
        let title: String
    }

    func createTodo(
      request: Request,
      arguments: CreateTodoArguments
    ) throws -> EventLoopFuture<Todo> {
      let todo = Todo(
        title: arguments.title
      )
      return todo.create(on: request.db).map { todo }
    }
    
    struct UpdateTodoArguments: Codable {
        let id: UUID
        let completed: Bool
    }
    
    func updateTodo(
      request: Request,
      arguments: UpdateTodoArguments
    ) throws -> EventLoopFuture<Bool> {
      Todo.find(arguments.id, on: request.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { (todo: Todo) -> EventLoopFuture<()> in
          todo.completed = arguments.completed
          return todo.update(on: request.db)
        }
        .transform(to: true)
    }

    struct DeleteTodoArguments: Codable {
      let id: UUID
    }

    func deleteTodo(
      request: Request,
      arguments: DeleteTodoArguments
    ) -> EventLoopFuture<Bool> {
      Todo.find(arguments.id, on: request.db)
        .unwrap(or: Abort(.notFound))
        .flatMap { $0.delete(on: request.db) }
        .transform(to: true)
    }
    
}

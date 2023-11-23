import Graphiti
import Vapor

let schema = try! Schema<Resolver, Request> {
  Scalar(UUID.self)

  Type(Todo.self) {
    Field("id", at: \.id)
    Field("title", at: \.title)
  }

  Query {
    Field("todos", at: Resolver.getAllTodos)
  }
}

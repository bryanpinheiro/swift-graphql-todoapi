import Graphiti
import Vapor

/*
type Todo {
  id: ID
  title: String!
  releaseYear: Int!
}

type Query {
  shows: [Show!]!
}

type Mutation {
  createShow(title: String! releaseYear: Int!): Show!
  deleteShow(id: UUID!): Boolean!
  updateShow(id: UUID! releaseYear: Int! title: String!): Boolean!
}
*/


final class Resolver {
  func getAllTodos(
    request: Request,
    arguments: NoArguments
  ) throws -> EventLoopFuture<[Todo]> {
    Todo.query(on: request.db).all()
  }
}

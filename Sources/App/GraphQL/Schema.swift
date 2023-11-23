import Graphiti
import Vapor

let schema = try! Schema<Resolver, Request> {
    Scalar(UUID.self)

    Type(Todo.self) {
        Field("id", at: \.id)
        Field("title", at: \.title)
        Field("completed", at: \.completed)
    }

    Query {
        Field("todos", at: Resolver.getAllTodos)
        Field("todo", at: Resolver.getTodo) {
            Argument("id", at: \.id)
        }
    }
    
    Mutation {
        Field("createTodo", at: Resolver.createTodo) {
            Argument("title", at: \.title)
        }
        
        Field("updateTodo", at: Resolver.updateTodo) {
            Argument("id", at: \.id)
            Argument("completed", at: \.completed)
        }
        
        Field("deleteTodo", at: Resolver.deleteTodo) {
            Argument("id", at: \.id)
        }
    }
}

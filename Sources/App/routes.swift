import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        let templateValues = [
            "title" : "gRPC + Vapor",
            "name" : "John Appleseed"
        ]
        
        return try await req.view.render("index", templateValues)
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    //try app.register(collection: TodoController())
}

import Fluent
import FluentMongoDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // Registramos el servidor gRPC
    app.servers.use(.gRPCServer)
    
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    try app.databases.use(.mongo(
        connectionString: Environment.get("DATABASE_URL") ?? "non://valid_url"
    ), as: .mongo)
    
    app.migrations.add(CreatePodcastDTO())

    //app.views.use(.leaf)

    // register routes
    //try routes(app)
}

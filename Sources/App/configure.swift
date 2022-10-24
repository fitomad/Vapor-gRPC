import Fluent
import FluentMongoDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // Registramos el servidor gRPC
    app.servers.use(.gRPCServer)
    
    // Preparamos la base de datos
    guard let mongodbURL = Environment.get("DATABASE_URL") else {
        fatalError("🚨 No se encuentra la variable de entorno para la base de datos")
    }
    
    try app.databases.use(.mongo(connectionString: mongodbURL), as: .mongo)
    
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    //app.migrations.add(CreatePodcastDTO())

    //app.views.use(.leaf)

    // register routes
    //try routes(app)
}

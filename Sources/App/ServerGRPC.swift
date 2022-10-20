import Foundation
import GRPC
import Vapor
import Logging

public extension Application.Servers.Provider {
    static var gRPCServer: Application.Servers.Provider {
        return Self {
            $0.servers.use { app in
                ServerGRPC(application: app)
            }
        }
    }
}

public class ServerGRPC: Vapor.Server {
    private(set) var port: Int
    private(set) var host: String
    private(set) var application: Application
    private(set) var server: GRPC.Server?

    init(application: Application) {
        self.application = application
        
        guard let host = Environment.get("GRPC_SERVER_HOST") else {
            fatalError("🚨 No se encuentra la variable de entorno HOST")
        }
        
        self.host = host
        
        guard let environmentPortValue = Environment.get("GRPC_SERVER_PORT"),
              let port = Int(environmentPortValue)
        else
        {
            fatalError("🚨 No se encuentra la variable de entorno PORT")
        }
        
        self.port = port
    }

    public func start(address: BindAddress?) throws {
        switch address {
            case .none:
                break
            case .hostname(let hostname, let port):
                if let hostname = hostname {
                    self.host = hostname
                }
                
                if let port = port {
                    self.port = port
                }
            default:
                fatalError("🚨 No se puede arrancar el servicio gRPC")
        }

        //set up logging
        var logger = Logger(label: "gRPC", factory: StreamLogHandler.standardOutput)
        logger.logLevel = .debug

        //bind to host and port. do not use SSL
        let group = application.eventLoopGroup

        let server = GRPC.Server.insecure(group: group)
          .withLogger(logger)
          .withServiceProviders([
            DefaultPodcastServiceProvider(self.application)
          ])
          .bind(host: self.host, port: self.port)
          
        server.map {
            $0.channel.localAddress
        }.whenSuccess { address in
            logger.debug("👍 Servidor gRPC listo en el puerto \(address!.port!)", metadata: nil)
        }

        self.server = try server.wait()
    }


    public var onShutdown: EventLoopFuture<Void> {
        return server!.channel.closeFuture
    }

    public func shutdown() {
        try! self.server!.close().wait()
    }
}

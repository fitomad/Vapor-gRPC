import Foundation
import GRPC
import Vapor
import Logging

public extension Application.Servers.Provider {
    static var gRPCServer: Application.Servers.Provider {
        return
    .init {
    $0.servers.use { app in GRPCServer(application: app)
    }
    }
    }
}

public class GRPCServer: Vapor.Server {
    private(set) var port = 1234
    private(set) var host = "localhost"
    private(set) var  application: Application
    private(set) var  server: GRPC.Server?


    init(application: Application) {
        self.application = application
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
      .withServiceProviders([ DefaultPodcastServiceProvider(self.application) ])
      .bind(host: self.host, port: self.port)
      
    server.map {
      $0.channel.localAddress
    }.whenSuccess { address in
      logger.debug("gRPC Server started on port \(address!.port!)", metadata: nil)
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

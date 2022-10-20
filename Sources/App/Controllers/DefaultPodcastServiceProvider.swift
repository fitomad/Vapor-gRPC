//
//  PodcastListController.swift
//  
//
//  Created by Adolfo Vera Blasco on 7/9/22.
//

import Foundation
import Vapor

import GRPC
import SwiftProtobuf
import NIOCore

final class DefaultPodcastServiceProvider: PodcastServiceAsyncProvider {
    var app: Application
      
    init(_ app: Application) {
        self.app = app
    }
    
    func fetchPodcasts(request: SwiftProtobuf.Google_Protobuf_Empty, context: GRPC.GRPCAsyncServerCallContext) async throws -> PodcastList {
        try await PodcastDTO.query(on: app.db).all()
        return PodcastList()
    }
}

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
    
    let repository: DefaultPodcastRepository
      
    init(_ app: Application) {
        self.app = app
        self.repository = DefaultPodcastRepository(for: app.db)
    }
    
    func fetchPodcasts(request: SwiftProtobuf.Google_Protobuf_Empty, context: GRPC.GRPCAsyncServerCallContext) async throws -> PodcastList {
        let podcasts = try await repository.fetchPodcasts()
        
        var list = PodcastList()
        list.podcasts = podcasts
        
        return list
    }
}

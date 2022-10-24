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
    
    func fetchPodcasts(request: Google_Protobuf_Empty, context: GRPCAsyncServerCallContext) async throws -> PodcastList {
        let podcasts = try await repository.fetchPodcasts()
        
        var list = PodcastList()
        list.podcasts = podcasts
        
        if list.podcasts.isEmpty {
            throw GRPCError.InvalidState("Parece que no hay podcasts...")
        }
        
        return list
    }
}

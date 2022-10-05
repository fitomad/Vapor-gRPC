//
//  PodcastListController.swift
//  
//
//  Created by Adolfo Vera Blasco on 7/9/22.
//

import Foundation
import Vapor

struct PodcastListController: RouteCollection {
    /// Register routes to be managed by this controller
    func boot(routes: RoutesBuilder) throws {
        let podcastListRoutes = routes.grouped("podcasts")
        
        podcastListRoutes.get(use: index)
    }
    
    // MARK: - Operations -
    
    func index(req: Request) async throws -> [String] {
        return [
            "podcast",
            "list"
        ]
    }
    
}

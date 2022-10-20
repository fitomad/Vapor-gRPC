//
//  DefaultPodcastRepository.swift
//  
//
//  Created by Adolfo Vera Blasco on 19/10/22.
//

import Foundation

import Fluent
import Vapor

final class DefaultPodcastRepository {
    
    private let database: Database
    
    init(for database: Database) {
        self.database = database
    }
    
    func fetchPodcasts() async throws -> [Podcast] {
        let repositoryPodcasts = try await PodcastDTO.query(on: database).all()
        
        let podcasts = repositoryPodcasts.map({ repositoryPodcast in
            var podcast = Podcast()
            
            podcast.title = repositoryPodcast.name
            podcast.artist = repositoryPodcast.artistName
            podcast.artworkURL = repositoryPodcast.artworkHeroURL
            
            return podcast
        })
        
        return podcasts
    }
}

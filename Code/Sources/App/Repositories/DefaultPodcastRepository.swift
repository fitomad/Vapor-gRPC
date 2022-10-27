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
        
        let podcasts = repositoryPodcasts.map(mapRepositoryPodcast)
        
        return podcasts
    }
    
    func fetchPodcasts(filteredBy term: String) async throws -> [Podcast] {
        let repositoryPodcasts = try await PodcastDTO.query(on: database)
            .filter(\.$name ~~ term)
            .all()
        
        let podcasts = repositoryPodcasts.map(mapRepositoryPodcast)
        
        return podcasts
    }
}

extension DefaultPodcastRepository {
    private func mapRepositoryPodcast(_ repositoryPodcast: PodcastDTO) -> Podcast {
        var podcast = Podcast()
        
        podcast.title = repositoryPodcast.name
        podcast.artist = repositoryPodcast.artistName
        podcast.artworkURL = repositoryPodcast.artworkHeroURL
        
        return podcast
    }
}

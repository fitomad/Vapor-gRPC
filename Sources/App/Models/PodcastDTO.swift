//
//  PodcastDTO.swift
//  
//
//  Created by Adolfo Vera Blasco on 5/10/22.
//

import Foundation

import Vapor
import Fluent
import BSON

final class PodcastDTO: Model, Content {
    static var schema = "PodcastCollection"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "id")
    var podcastId: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "artistName")
    var artistName: String
    
    @Field(key: "artworkUrl100")
    var artworkThumbnailURL: String
}

extension PodcastDTO {
    convenience init(fromPodcast grpcEntity: Podcast) {
        self.init()
        
        self.name = grpcEntity.title
        self.artistName = grpcEntity.artist
        self.artworkThumbnailURL = grpcEntity.artworkURL
    }
}

extension PodcastDTO {
    var artworkHeroURL: String {
        let heroURL = artworkThumbnailURL.replacingOccurrences(of: "100x100bb", with: "1000x1000bb")
                          
        return heroURL
    }
}


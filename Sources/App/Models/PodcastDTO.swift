//
//  PodcastDTO.swift
//  
//
//  Created by Adolfo Vera Blasco on 5/10/22.
//

import Foundation

import Vapor
import Fluent

final class PodcastDTO: Model, Content {
    static var schema = "podcast"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "id")
    var podcastId: String
    
    @Field(key: "name")
    var name: String
}

extension PodcastDTO {
    convenience init(fromPodcast grpcEntity: Podcast) {
        self.init()
        
        self.name = grpcEntity.title
    }
}

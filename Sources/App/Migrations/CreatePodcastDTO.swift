//
//  CreatePodcastDTO.swift
//  
//
//  Created by Adolfo Vera Blasco on 5/10/22.
//

import Foundation
import Fluent

struct CreatePodcastDTO: AsyncMigration {
    static let schema = "podcast"
    
    func revert(on database: Database) async throws {
        try await database.schema(CreatePodcastDTO.schema)
            .delete()
    }
    
    func prepare(on database: Database) async throws {
        try await database.schema(CreatePodcastDTO.schema)
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    
}

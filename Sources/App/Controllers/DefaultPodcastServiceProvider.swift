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
    func fetchPodcasts(request: SwiftProtobuf.Google_Protobuf_Empty, context: GRPC.GRPCAsyncServerCallContext) async throws -> PodcastList {
        return PodcastList()
    }
}

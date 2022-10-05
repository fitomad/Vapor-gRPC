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

final class DefaultPodcastServiceProvider: PodcastServiceProvider {
    var interceptors: PodcastServiceServerInterceptorFactoryProtocol?
    
    func fetchPodcasts(request: SwiftProtobuf.Google_Protobuf_Empty, context: GRPC.StatusOnlyCallContext) -> NIOCore.EventLoopFuture<PodcastList> {
        
    }
    

}

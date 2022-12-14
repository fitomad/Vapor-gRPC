//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: podcasts.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Usage: instantiate `PodcastServiceClient`, then call methods of this protocol to make API calls.
internal protocol PodcastServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: PodcastServiceClientInterceptorFactoryProtocol? { get }

  func fetchPodcasts(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Empty, PodcastList>

  func filterPodcasts(
    _ request: PodcastRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<PodcastRequest, PodcastList>
}

extension PodcastServiceClientProtocol {
  internal var serviceName: String {
    return "PodcastService"
  }

  /// Unary call to FetchPodcasts
  ///
  /// - Parameters:
  ///   - request: Request to send to FetchPodcasts.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func fetchPodcasts(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<SwiftProtobuf.Google_Protobuf_Empty, PodcastList> {
    return self.makeUnaryCall(
      path: PodcastServiceClientMetadata.Methods.fetchPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFetchPodcastsInterceptors() ?? []
    )
  }

  /// Unary call to FilterPodcasts
  ///
  /// - Parameters:
  ///   - request: Request to send to FilterPodcasts.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func filterPodcasts(
    _ request: PodcastRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<PodcastRequest, PodcastList> {
    return self.makeUnaryCall(
      path: PodcastServiceClientMetadata.Methods.filterPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFilterPodcastsInterceptors() ?? []
    )
  }
}

#if compiler(>=5.6)
@available(*, deprecated)
extension PodcastServiceClient: @unchecked Sendable {}
#endif // compiler(>=5.6)

@available(*, deprecated, renamed: "PodcastServiceNIOClient")
internal final class PodcastServiceClient: PodcastServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: PodcastServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: PodcastServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the PodcastService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: PodcastServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct PodcastServiceNIOClient: PodcastServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: PodcastServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the PodcastService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: PodcastServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#if compiler(>=5.6)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol PodcastServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: PodcastServiceClientInterceptorFactoryProtocol? { get }

  func makeFetchPodcastsCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Empty, PodcastList>

  func makeFilterPodcastsCall(
    _ request: PodcastRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<PodcastRequest, PodcastList>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension PodcastServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return PodcastServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: PodcastServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeFetchPodcastsCall(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<SwiftProtobuf.Google_Protobuf_Empty, PodcastList> {
    return self.makeAsyncUnaryCall(
      path: PodcastServiceClientMetadata.Methods.fetchPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFetchPodcastsInterceptors() ?? []
    )
  }

  internal func makeFilterPodcastsCall(
    _ request: PodcastRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<PodcastRequest, PodcastList> {
    return self.makeAsyncUnaryCall(
      path: PodcastServiceClientMetadata.Methods.filterPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFilterPodcastsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension PodcastServiceAsyncClientProtocol {
  internal func fetchPodcasts(
    _ request: SwiftProtobuf.Google_Protobuf_Empty,
    callOptions: CallOptions? = nil
  ) async throws -> PodcastList {
    return try await self.performAsyncUnaryCall(
      path: PodcastServiceClientMetadata.Methods.fetchPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFetchPodcastsInterceptors() ?? []
    )
  }

  internal func filterPodcasts(
    _ request: PodcastRequest,
    callOptions: CallOptions? = nil
  ) async throws -> PodcastList {
    return try await self.performAsyncUnaryCall(
      path: PodcastServiceClientMetadata.Methods.filterPodcasts.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFilterPodcastsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct PodcastServiceAsyncClient: PodcastServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: PodcastServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: PodcastServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

#endif // compiler(>=5.6)

internal protocol PodcastServiceClientInterceptorFactoryProtocol: GRPCSendable {

  /// - Returns: Interceptors to use when invoking 'fetchPodcasts'.
  func makeFetchPodcastsInterceptors() -> [ClientInterceptor<SwiftProtobuf.Google_Protobuf_Empty, PodcastList>]

  /// - Returns: Interceptors to use when invoking 'filterPodcasts'.
  func makeFilterPodcastsInterceptors() -> [ClientInterceptor<PodcastRequest, PodcastList>]
}

internal enum PodcastServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "PodcastService",
    fullName: "PodcastService",
    methods: [
      PodcastServiceClientMetadata.Methods.fetchPodcasts,
      PodcastServiceClientMetadata.Methods.filterPodcasts,
    ]
  )

  internal enum Methods {
    internal static let fetchPodcasts = GRPCMethodDescriptor(
      name: "FetchPodcasts",
      path: "/PodcastService/FetchPodcasts",
      type: GRPCCallType.unary
    )

    internal static let filterPodcasts = GRPCMethodDescriptor(
      name: "FilterPodcasts",
      path: "/PodcastService/FilterPodcasts",
      type: GRPCCallType.unary
    )
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol PodcastServiceProvider: CallHandlerProvider {
  var interceptors: PodcastServiceServerInterceptorFactoryProtocol? { get }

  func fetchPodcasts(request: SwiftProtobuf.Google_Protobuf_Empty, context: StatusOnlyCallContext) -> EventLoopFuture<PodcastList>

  func filterPodcasts(request: PodcastRequest, context: StatusOnlyCallContext) -> EventLoopFuture<PodcastList>
}

extension PodcastServiceProvider {
  internal var serviceName: Substring {
    return PodcastServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "FetchPodcasts":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<PodcastList>(),
        interceptors: self.interceptors?.makeFetchPodcastsInterceptors() ?? [],
        userFunction: self.fetchPodcasts(request:context:)
      )

    case "FilterPodcasts":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<PodcastRequest>(),
        responseSerializer: ProtobufSerializer<PodcastList>(),
        interceptors: self.interceptors?.makeFilterPodcastsInterceptors() ?? [],
        userFunction: self.filterPodcasts(request:context:)
      )

    default:
      return nil
    }
  }
}

#if compiler(>=5.6)

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol PodcastServiceAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: PodcastServiceServerInterceptorFactoryProtocol? { get }

  @Sendable func fetchPodcasts(
    request: SwiftProtobuf.Google_Protobuf_Empty,
    context: GRPCAsyncServerCallContext
  ) async throws -> PodcastList

  @Sendable func filterPodcasts(
    request: PodcastRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> PodcastList
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension PodcastServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return PodcastServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return PodcastServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: PodcastServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "FetchPodcasts":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<SwiftProtobuf.Google_Protobuf_Empty>(),
        responseSerializer: ProtobufSerializer<PodcastList>(),
        interceptors: self.interceptors?.makeFetchPodcastsInterceptors() ?? [],
        wrapping: self.fetchPodcasts(request:context:)
      )

    case "FilterPodcasts":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<PodcastRequest>(),
        responseSerializer: ProtobufSerializer<PodcastList>(),
        interceptors: self.interceptors?.makeFilterPodcastsInterceptors() ?? [],
        wrapping: self.filterPodcasts(request:context:)
      )

    default:
      return nil
    }
  }
}

#endif // compiler(>=5.6)

internal protocol PodcastServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'fetchPodcasts'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFetchPodcastsInterceptors() -> [ServerInterceptor<SwiftProtobuf.Google_Protobuf_Empty, PodcastList>]

  /// - Returns: Interceptors to use when handling 'filterPodcasts'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFilterPodcastsInterceptors() -> [ServerInterceptor<PodcastRequest, PodcastList>]
}

internal enum PodcastServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "PodcastService",
    fullName: "PodcastService",
    methods: [
      PodcastServiceServerMetadata.Methods.fetchPodcasts,
      PodcastServiceServerMetadata.Methods.filterPodcasts,
    ]
  )

  internal enum Methods {
    internal static let fetchPodcasts = GRPCMethodDescriptor(
      name: "FetchPodcasts",
      path: "/PodcastService/FetchPodcasts",
      type: GRPCCallType.unary
    )

    internal static let filterPodcasts = GRPCMethodDescriptor(
      name: "FilterPodcasts",
      path: "/PodcastService/FilterPodcasts",
      type: GRPCCallType.unary
    )
  }
}

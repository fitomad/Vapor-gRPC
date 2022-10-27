// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: podcasts.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Podcast {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var artist: String = String()

  var artworkURL: String = String()

  var appleURL: String = String()

  var appleID: String = String()

  var genres: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct PodcastList {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var podcasts: [Podcast] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct PodcastRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var includeAdultContent: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Podcast: @unchecked Sendable {}
extension PodcastList: @unchecked Sendable {}
extension PodcastRequest: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Podcast: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Podcast"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "artist"),
    3: .same(proto: "artworkURL"),
    4: .same(proto: "appleURL"),
    5: .same(proto: "appleID"),
    6: .same(proto: "genres"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.artist) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.artworkURL) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.appleURL) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.appleID) }()
      case 6: try { try decoder.decodeRepeatedStringField(value: &self.genres) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.artist.isEmpty {
      try visitor.visitSingularStringField(value: self.artist, fieldNumber: 2)
    }
    if !self.artworkURL.isEmpty {
      try visitor.visitSingularStringField(value: self.artworkURL, fieldNumber: 3)
    }
    if !self.appleURL.isEmpty {
      try visitor.visitSingularStringField(value: self.appleURL, fieldNumber: 4)
    }
    if !self.appleID.isEmpty {
      try visitor.visitSingularStringField(value: self.appleID, fieldNumber: 5)
    }
    if !self.genres.isEmpty {
      try visitor.visitRepeatedStringField(value: self.genres, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Podcast, rhs: Podcast) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.artist != rhs.artist {return false}
    if lhs.artworkURL != rhs.artworkURL {return false}
    if lhs.appleURL != rhs.appleURL {return false}
    if lhs.appleID != rhs.appleID {return false}
    if lhs.genres != rhs.genres {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension PodcastList: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "PodcastList"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "podcasts"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.podcasts) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.podcasts.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.podcasts, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: PodcastList, rhs: PodcastList) -> Bool {
    if lhs.podcasts != rhs.podcasts {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension PodcastRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "PodcastRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "includeAdultContent"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.includeAdultContent) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if self.includeAdultContent != false {
      try visitor.visitSingularBoolField(value: self.includeAdultContent, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: PodcastRequest, rhs: PodcastRequest) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.includeAdultContent != rhs.includeAdultContent {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
//
// AdminCat.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AdminCat: Codable, JSONEncodable, Hashable {

    public var id: String?
    public var validated: Bool
    public var file: String
    public var mimetype: String?
    public var size: Double?
    public var tags: [String]
    public var createdAt: Date?
    public var updatedAt: Date?

    public init(id: String? = nil, validated: Bool, file: String, mimetype: String? = nil, size: Double? = nil, tags: [String], createdAt: Date? = nil, updatedAt: Date? = nil) {
        self.id = id
        self.validated = validated
        self.file = file
        self.mimetype = mimetype
        self.size = size
        self.tags = tags
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id = "_id"
        case validated
        case file
        case mimetype
        case size
        case tags
        case createdAt
        case updatedAt
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(validated, forKey: .validated)
        try container.encode(file, forKey: .file)
        try container.encodeIfPresent(mimetype, forKey: .mimetype)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encode(tags, forKey: .tags)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
    }
}


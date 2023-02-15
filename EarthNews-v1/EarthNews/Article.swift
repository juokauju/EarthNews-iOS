//
//  Article.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-14.
//

import Foundation

struct Article {
    var id: String
    var date: Date
    var title: String
    var webUrl: URL
    var additionalInfo: AdditionalInfo?
    var tags: [Tag]
}

struct AdditionalInfo {
    var subtitle: String
    var body: String
    var thumbnail: String
}

struct Tag {
    var author: String
}

// MARK: - Decodable, Coding Keys
extension Article: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, webUrl, tags
        case additionalInfo = "fields"
        case date = "webPublicationDate"
        case title = "webTitle"
    }
}

extension AdditionalInfo: Decodable {
    enum CodingKeys: String, CodingKey {
        case subtitle = "trailText"
        case body, thumbnail
    }
}

extension Tag: Decodable {
    enum CodingKeys: String, CodingKey {
        case author = "webTitle"
    }
}

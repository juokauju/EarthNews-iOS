//
//  Article.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-14.
//

import Foundation

struct Root {
    var response: Response
}

struct Response {
    var results: Results
}

struct Results {
    var articles: [[String: Article]]
}

struct Article {
    var id: String
    var date: Date
    var title: String
    var webUrl: URL
    var fields: Fields
    var tags: Tags
}

struct Fields {
    var subtitle: String
    var body: String
    var thumbnail: String
}

struct Tags {
    var author: String
}

// MARK: - Coding Keys
extension Root: Decodable {
    enum CodingKeys: String, CodingKey {
        case response
    }
}

extension Response: Decodable {
    enum CodingKeys: String, CodingKey {
        case results
    }
}

extension Results: Decodable {
    enum CodingKeys: String, CodingKey {
        case articles = ""
    }
}

extension Article: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, webUrl, fields, tags
        case date = "webPublicationDate"
        case title = "webTitle"
    }
}

extension Fields: Decodable {
    enum CodingKeys: String, CodingKey {
        case subtitle = "trailText"
        case body, thumbnail
    }
}

extension Tags: Decodable {
    enum CodingKeys: String, CodingKey {
        case author = "webTitle"
    }
}

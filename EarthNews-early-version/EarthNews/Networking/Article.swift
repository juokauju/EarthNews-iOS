//
//  Article.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//


import UIKit

struct Wrapper: Decodable {
    let articles: [Article]
}

struct Article {
    let title: String
    let description: String
    let content: String
    let url: URL
    let imageUrl: URL?
    let date: Date
    let source: Source
}

extension Article: Decodable {
    enum CodingKeys: String, CodingKey {
        case title, description, content, url, source
        case imageUrl = "image"
        case date = "publishedAt"
        
    }
}

struct Source {
    let name: String
    let url: URL
}

extension Source: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, url
    }
}

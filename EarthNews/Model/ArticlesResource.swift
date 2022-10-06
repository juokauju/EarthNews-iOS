//
//  ArticlesResource.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import Foundation

struct ArticlesResource {
    let searchKeyword: String = "environment OR environmental OR climate OR pollution"
    var url: URL {
        var components = URLComponents(string: "https://gnews.io/api/v4/search?")!
        components.queryItems = [
        URLQueryItem(name: "q", value: searchKeyword),
        URLQueryItem(name: "lang", value: "en"),
        URLQueryItem(name: "in", value: "title,description,content")
        ]
        return components.url!
    }
}

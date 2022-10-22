//
//  ArticlesResource.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import Foundation

struct ArticlesResource {
    let searchKeyword: String = "environmental issues OR environmental issue OR environmental"
    var url: URL {
        let token = "75f2032c80e2a80287125483cca822d2"
        var components = URLComponents(string: "https://gnews.io/api/v4/search?\(token)")!
        components.queryItems = [
        URLQueryItem(name: "q", value: searchKeyword),
        URLQueryItem(name: "lang", value: "en"),
        URLQueryItem(name: "in", value: "title,description,content"),
        URLQueryItem(name: "token", value: token)
        ]
        return components.url!
    }
}

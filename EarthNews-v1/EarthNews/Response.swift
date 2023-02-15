//
//  Response.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-15.
//

import Foundation

struct Root: Decodable {
    var response: Response
}

struct Response: Decodable {
    var results: [Article]
}

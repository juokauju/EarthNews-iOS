//
//  GuardianAPIService.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-14.
//

import UIKit

enum NetworkError: Error {
    case urlError
    case httpResponseError
    case serviceError
    case decodingError
}

struct GuardianResource {
    var url: URL? = {
        let apiKey = "bcf27734-9851-4cd0-a99d-894930ce07fd"
        let endpointUrl = "https://content.guardianapis.com/search"
        var components = URLComponents(string: endpointUrl)
        components?.queryItems = [
        URLQueryItem(name: "show-elements", value: "image"),
        URLQueryItem(name: "section", value: "environment"),
        URLQueryItem(name: "show-flieds", value: "thumbnail,body,trailText"),
        URLQueryItem(name: "show-tags", value: "contributor"),
        URLQueryItem(name: "api-key", value: apiKey)
        ]
        return components?.url
    }()
}

class GuardianAPIService {
    let resource = GuardianResource()
    
    func fetch() async throws {
        guard let url = resource.url else { throw NetworkError.urlError }
        
        do {
            let data = try await load(url)
            decode(data)
  
        } catch {
            print(NetworkError.serviceError)
        }
    }
    
    func load(_ url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.httpResponseError }
        return data
    }
    
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let root = try decoder.decode(Root.self, from: data)
            print(root.response.results.articles)
        } catch {
            print(error)
        }
    
    }
}

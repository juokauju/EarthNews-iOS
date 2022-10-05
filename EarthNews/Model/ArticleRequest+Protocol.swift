//
//  ArticleRequest+Protocol.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import UIKit

protocol NetworkRequest: AnyObject {
    associatedtype Model
    func execute() async
    func decode(_ data: Data) -> Model?
}

extension NetworkRequest {
    fileprivate func load(_ url: URL) async throws {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badUrl }
        let _ = decode(data)
    }
}

class ArticleRequest {
    let resource: ArticleResource
    
    init(resource: ArticleResource) {
        self.resource = resource
    }
}

extension ArticleRequest: NetworkRequest {
    func execute() async {
        do {
            try await load(resource.url)
        } catch {
            print(error)
        }
    }
    
    func decode(_ data: Data) -> [Article]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let wrapper = try? decoder.decode(Wrapper.self, from: data)
        return wrapper?.articles
    }
}

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func execute() async {
        do {
            try await load(url)
        } catch {
            print(error)
        }
    }
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}


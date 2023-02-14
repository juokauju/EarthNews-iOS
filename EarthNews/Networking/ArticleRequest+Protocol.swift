//
//  ArticlesRequest+Protocol.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import UIKit

protocol NetworkRequest: AnyObject {
    associatedtype Model
    func execute() async throws -> Model?
    func decode(_ data: Data) -> Model?
}

extension NetworkRequest {
    fileprivate func load(_ url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.badUrl }
        return data
    }
}

enum NetworkError: Error {
    case badUrl
    case loadingArticleRequestError
    case loadingImageRequestError
    case jsonDecodeError
}

struct ArticlesResource {
    let searchKeyword: String = "(environmental AND issues) OR (environment AND issue) OR environmental OR (climate AND change)"
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

class ArticlesRequest {
    let resource: ArticlesResource
    
    init(resource: ArticlesResource) {
        self.resource = resource
    }
}

extension ArticlesRequest: NetworkRequest {
    func execute() async throws -> [Article]? {
        do {
            let data = try await load(resource.url)
            return decode(data)
        } catch {
            print(NetworkError.loadingArticleRequestError)
        }
        return nil
    }
    
    func decode(_ data: Data) -> [Article]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let wrapper = try decoder.decode(Wrapper.self, from: data)
            return wrapper.articles
        } catch {
            print(NetworkError.jsonDecodeError)
        }
        return nil
    }
}

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func execute() async throws -> UIImage? {
        do {
            let data = try await load(url)
            return decode(data)
        } catch {
            print(NetworkError.loadingImageRequestError)
        }
        return nil
    }
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}

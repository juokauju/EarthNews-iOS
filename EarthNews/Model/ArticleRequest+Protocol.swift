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
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badUrl }
        return data
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
            print(error)
        }
        return nil
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
    func execute() async throws -> UIImage? {
        do {
            let data = try await load(url)
            return decode(data)
        } catch {
            print(error)
        }
        return nil
    }
    
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
}


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
    
    func hardcodeURL() -> URL? {
        let endpoint = "https://content.guardianapis.com/search?"
        let showFields = "show-fields=thumbnail%2Cbody%2CtrailText&"
        let showElement = "show-elements=image&"
        let section = "section=environment&"
        let tags = "show-tags=contributor&"
        let apiKey = "api-key=bcf27734-9851-4cd0-a99d-894930ce07fd"
        let urlString = endpoint + showFields + showElement + section + tags + apiKey
        
        return URL(string: urlString)
    }
}

class GuardianAPIService {
    let resource = GuardianResource()
    
    func fetchArticles() async throws -> [Article]? {
        guard let url = resource.hardcodeURL() else { throw NetworkError.urlError }
        
        do {
            let data = try await load(url)
            return decode(data)
        } catch {
            print(NetworkError.serviceError)
        }
        return nil
    }
    
    func load(_ url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.httpResponseError }
        return data
    }
    
    func decode(_ data: Data) -> [Article]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let root = try decoder.decode(Root.self, from: data)
            return root.response.results
        } catch {
            print(error)
        }
        return nil
    }
    
    func fetchImage(with urlString: String?) async throws -> UIImage {
        let noImageIcon = UIImage(systemName: "eye.slash")!
        
        guard let urlString = urlString else {
            return noImageIcon
        }

        let url = URL(string: urlString)
        
        guard let url = url else {
            return noImageIcon
        }

        do {
            let data = try await load(url)
            let image = UIImage(data: data)
            return image ?? noImageIcon
        } catch {
            print(NetworkError.serviceError)
        }
        return noImageIcon
    }
}

extension GuardianAPIService {
    func fetchArticleViewModels(completion: @escaping ([ArticleViewModel]) -> Void) {
        Task {
            do {
                guard let articles = try await fetchArticles() else {
                    completion([])
                    return
                }
                var articleViewModels: [ArticleViewModel] = []
                for article in articles {
                    let imageUrl = article.additionalInfo?.thumbnail
                    let image = try await fetchImage(with: imageUrl)
                    
                    let articleViewModel = ArticleViewModel(
                        id: article.id,
                        date: article.date,
                        title: article.title,
                        subtitle: article.additionalInfo?.subtitle,
                        body: article.additionalInfo?.body,
                        webUrl: article.webUrl,
                        author: article.tags[0].author,
                        image: image
                    )
                    
                    articleViewModels.append(articleViewModel)
                    
                    if articles.count == articleViewModels.count {
                        completion(articleViewModels)
                    }
                }
            }
        }
    }
}

//
//  ArticleAndImageLoader.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit

class ArticleAndImageLoader {
    func loadArticlesAndImages() async throws -> [Article]? {
        let articles = try await loadArticles()
        
        guard let articles = articles else { return nil }
        
        for var article in articles {
            if let imageUrl = article.imageUrl {
                let image = try await loadImage(url: imageUrl)
                article.image = image
                return articles
            }
        }
        return nil
    }
    
    private func loadArticles() async throws -> [Article]? {
        let resource = ArticlesResource()
        let request = ArticlesRequest(resource: resource)
        return try await request.execute()
    }
    
    private func loadImage(url: URL) async throws -> UIImage? {
        let imageRequest = ImageRequest(url: url)
        return try await imageRequest.execute()
    }
}

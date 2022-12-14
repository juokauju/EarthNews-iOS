//
//  ArticleAndImageLoader.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit

actor ArticleAndImageLoader {
    var articles: [Article]?
    
    func load() {
        guard let articles = articles else { return }

        Task {
            try await loadArticles()
            for var article in articles {
                let image = try await loadImage(url: article.imageUrl)
                article.image = image
            }
        }
    }
    
    private func loadArticles() async throws {
        let resource = ArticlesResource()
        let request = ArticlesRequest(resource: resource)
        articles = try await request.execute()
    }
    
    private func loadImage(url: URL) async throws -> UIImage? {
        let imageRequest = ImageRequest(url: url)
        return try await imageRequest.execute()
    }
}

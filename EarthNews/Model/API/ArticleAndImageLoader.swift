//
//  ArticleAndImageLoader.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit

actor ArticleAndImageLoader {
    func loadArticlesAndImages() async throws -> [ArticleWithImage]? {
        guard let articles = try await loadArticles() else {
            fatalError("Articles failed to load.") }
        
        var articlesWithImages: [ArticleWithImage] = []
        
        for article in articles {
            if let imageUrl = article.imageUrl {
                let image = try await loadImage(url: imageUrl)
               
                let maker = ArticleWithImageMaker()
                let articleWithImage = maker.create(from: article,
                                                    image: image ?? maker.noImageIcon)
                articlesWithImages.append(articleWithImage)
            }
        }
        return articlesWithImages
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


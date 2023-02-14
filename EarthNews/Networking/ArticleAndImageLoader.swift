//
//  ArticleAndImageLoader.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit

struct ArticleWithImage {
    let title: String
    let description: String
    let content: String
    let url: URL
    let imageUrl: URL?
    let date: Date
    let source: Source
    var image: UIImage
}

struct ArticleWithImageMaker {
    func create(from article: Article, image: UIImage) -> ArticleWithImage {
        let articleWithImage = ArticleWithImage(
            title: article.title,
            description: article.description,
            content: article.content,
            url: article.url,
            imageUrl: article.imageUrl,
            date: article.date,
            source: article.source,
            image: image)
        return articleWithImage
    }
    
    var noImageIcon: UIImage = {
        UIImage(systemName: "eye.slash") ?? UIImage()
    }()
}

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
        let request = ImageRequest(url: url)
        return try await request.execute()
    }
}


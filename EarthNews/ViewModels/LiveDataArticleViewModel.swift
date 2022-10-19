//
//  LiveDataArticleViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import Foundation
import UIKit


class LiveDataArticleViewModel: ArticleViewModel {
    var articles: [ArticleWithImage] = []
    
    private var isLoading = false
    
    func fetchArticles(completion: @escaping (Bool) -> ()) {
        guard !isLoading else { return }
        isLoading = true
        let loader = ArticleAndImageLoader()
        Task {
            do {
                let fetchedArticles = try await loader.loadArticlesAndImages()
                
                DispatchQueue.main.async {
                    if let articles = fetchedArticles {
                        print("fetchArticles: \(String(describing: articles[0].image))")
                        self.articles = articles
                        self.isLoading = false
                        completion(true)
                    }
                }
            } catch {
                print(error)
                completion(false)
            }
        }
    }
}

enum LoadError: Error {
    case noArticlesInLoader
}

extension LiveDataArticleViewModel: DatabaseCoordinatorDelegate {
    
    weak var delegate: DatabaseCoordinatorDelegate? {
        self
    }
    
    var actionOnDatabaseIcon: String {
        DatabaseActionIconString.save.rawValue
    }
    
    func actOnDatabase(with article: ArticleWithImage) {
        delegate?.didCreate(item: article)
    }
}

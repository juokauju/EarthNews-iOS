//
//  LiveArticleViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import UIKit


class LiveArticleViewModel: ArticleViewModel {
    var articles: [ArticleWithImage] = []
    
    private let loader = ArticleAndImageLoader()
    private var isLoading = false
    
    func fetchArticles(completion: @escaping (Bool) -> ()) {
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let fetchedArticles = try await loader.loadArticlesAndImages()
                
                DispatchQueue.main.async {
                    if let articles = fetchedArticles {
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

extension LiveArticleViewModel: DatabaseCoordinatorDelegate {
    
    weak var delegate: DatabaseCoordinatorDelegate? {
        self
    }
    
    var actionOnDatabaseIcon: UIImage {
        let iconString = DatabaseActionIconString.save.rawValue
        let image = UIImage(systemName: iconString)
        guard let image = image else {
            fatalError("There is no image for database icon image in LiveArticleViewModel.")
        }
        return image
    }
    
    func actOnDatabase(with article: ArticleWithImage) {
        delegate?.didCreate(item: article)
    }
    
    enum DatabaseDelegateError: Error {
        case noImageForIcon
    }
}

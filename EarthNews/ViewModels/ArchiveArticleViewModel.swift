//
//  ArchiveArticleViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-22.
//

import Foundation

class ArchiveArticleViewModel: ArticleViewModel {
    var articles: [ArticleWithImage] = []
    
    private let database = CoreDataCoordinator()
    
    func fetchArticles(completion: @escaping (Bool) -> ()) {
        let fetchedArticles = database.fetch()
        DispatchQueue.main.async {
            self.articles = fetchedArticles
            completion(true)
        }
        completion(false)
    }
}

extension ArchiveArticleViewModel {
    
    var actionOnDatabaseIcon: String {
        DatabaseActionIconString.delete.rawValue
    }
    
    func actOnDatabase(with article: ArticleWithImage) {
        database.delete(item: article)
    }
    
}

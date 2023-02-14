//
//  ArchiveArticleViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-22.
//

import Foundation
import UIKit

class ArchiveArticleViewModel: ArticleViewModel {
    var articles: [ArticleWithImage] = []
    
    private let database = CoreDataCoordinator.shared
    
    func fetchArticles(completion: @escaping (Bool) -> ()) {
        let fetchedArticles = database.fetch()
        DispatchQueue.main.async {
            self.articles = fetchedArticles
            print("view model calls fetching in database, result: \(fetchedArticles)")
            completion(true)
        }
        completion(false)
    }
}

extension ArchiveArticleViewModel {
    var actionOnDatabaseIcon: UIImage {
        let iconString = DatabaseActionIconString.delete.rawValue
        let image = UIImage(systemName: iconString)
        guard let image = image else {
            fatalError("There is no image for database icon image in ArchiveArticleViewModel.")
        }
        return image
    }
    
    func actOnDatabase(with article: ArticleWithImage) {
        database.delete(item: article)
    }
    
}

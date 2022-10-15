//
//  LiveDataViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import Foundation
import UIKit

class LiveDataViewModel: ArticlesViewModel {
    var articles: [Article] = []
    
    private var isLoading = false
    
    func fetchArticles() {
        guard !isLoading else { return }
        isLoading = true

        let loader = ArticleAndImageLoader()
        Task {
            await loader.loadArticlesAndImages()
            if let articles = await loader.articles {
                self.articles = articles
                isLoading = false
            }
        }
    }
}

extension LiveDataViewModel: DatabaseCoordinatorDelegate {
    
    weak var delegate: DatabaseCoordinatorDelegate? {
        self
    }
    
    var actionOnDatabaseIcon: String {
        DatabaseActionIconString.save.rawValue
    }
    
    func actOnDatabase(with article: Article) {
        delegate?.didCreate(item: article)
    }
}

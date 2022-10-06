//
//  LiveDataViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-05.
//

import Foundation

class LiveDataViewModel: ArticlesViewModel {
    var articles: [Article] = []
    
    private var isLoading = false
    
    func fetchArticles() {
        guard !isLoading else { return }
        isLoading = true
        let resource = ArticlesResource()
        let request = ArticlesRequest(resource: resource)
        
        Task {
            if let articles = try await request.execute() {
                self.articles = articles
                isLoading = false
            }
        }
    }
}

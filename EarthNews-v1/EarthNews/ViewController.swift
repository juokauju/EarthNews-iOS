//
//  ViewController.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-13.
//

import UIKit

class ViewController: UIViewController {
    
    let articleView = ArticleShortView()
    let service = GuardianAPIService()
    
    private var articles: [ArticleViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticles()
        setupArticleView()
    }

    private func loadArticles() {
        service.fetchArticleViewModels { articles in
            self.articles = articles
            DispatchQueue.main.async {
                print("here is artciles count: \(articles.count)")
            }
        }
    }
    private func setupArticleView() {
        view.addSubview(articleView)
        NSLayoutConstraint.activate([
            articleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            articleView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5),
            articleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


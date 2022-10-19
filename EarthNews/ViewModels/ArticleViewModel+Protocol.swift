//
//  ArticlesViewModel+Protocol.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import Foundation

protocol ArticleViewModel {
    var articles: [Article] { get }
    func fetchArticles(completion: @escaping (Bool) -> ())
    
//    MARK: Database actions
    
    var actionOnDatabaseIcon: String { get }
    func actOnDatabase(with article: Article)
}

//
//  ArticlesViewModel+Protocol.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import UIKit

protocol ArticleViewModel {
    var articles: [ArticleWithImage] { get }
    func fetchArticles(completion: @escaping (Bool) -> ())
    
//    MARK: Database actions
    
    var actionOnDatabaseIcon: UIImage { get }
    func actOnDatabase(with article: ArticleWithImage)
}

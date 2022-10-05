//
//  ArticlesViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-09-30.
//

import Foundation

protocol ArticlesViewModel {
    var articles: [Article] { get }
    
    func fetchArticles()
}


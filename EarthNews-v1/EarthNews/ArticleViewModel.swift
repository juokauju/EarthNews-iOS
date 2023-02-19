//
//  ArticleViewModel.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2023-02-17.
//

import UIKit

struct ArticleViewModel {
    let id: String
    let date: Date
    let title: String
    let subtitle: String?
    let body: String?
    let webUrl: URL
    let author: String
    let image: UIImage
}

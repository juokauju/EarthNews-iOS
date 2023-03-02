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
    let authorTags: [Tag]
    let image: UIImage
    
    func getAuthor() -> String {
        if !authorTags.isEmpty {
            return "by \(authorTags[0].author)"
        } else {
            return "by The Guardian"
        }
    }
    
    func getSubtitleAsNonHtml() -> NSMutableAttributedString {
        guard let htmlString = subtitle else { return .init(string: "Invalid content") }
        return htmlString.makeAttributedString()
    }
    
    func getBodyAsNonHtml() -> NSMutableAttributedString {
        guard let htmlString = body else { return .init(string: "Invalid content") }
        return htmlString.makeAttributedString()
    }
}

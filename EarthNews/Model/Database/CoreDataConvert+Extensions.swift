//
//  CoreDataConvert+Extensions.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit
import CoreData

extension ArticleCoreDataEntity {
    func convertToArticle() -> ArticleWithImage {
        guard let title = title,
              let subtitle = subtitle,
              let content = content,
              let date = date,
              let url = url,
              let sourceUrl = sourceUrl,
              let sourceName = sourceName,
              let image = image else {
            fatalError("Failed to convert from database to ArticleWithImage")
        }
              
        let source = Source(name: sourceName, url: sourceUrl)
        
        return ArticleWithImage(
            title: title,
            description: subtitle,
            content: content,
            url: url,
            imageUrl: nil,
            date: date,
            source: source,
            image: image
        )
    }
}

extension ArticleWithImage {
    @discardableResult func convertToManagedObject(
        in context: NSManagedObjectContext) -> ArticleCoreDataEntity
    {
        let managedObject: ArticleCoreDataEntity = ArticleCoreDataEntity(context: context)
        managedObject.title = self.title
        managedObject.subtitle = self.description
        managedObject.content = self.content
        managedObject.url = self.url
        managedObject.date = self.date
        managedObject.sourceName = self.source.name
        managedObject.sourceUrl = self.source.url
        managedObject.image = image
        return managedObject
    }
}


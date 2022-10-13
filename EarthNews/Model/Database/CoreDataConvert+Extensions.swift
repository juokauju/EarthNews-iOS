//
//  CoreDataConvert+Extensions.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit
import CoreData

extension ArticleCoreDataEntity {
    func convertToArticle() -> Article {
        guard let title = title,
              let subtitle = subtitle,
              let content = content,
              let date = date,
              let url = url,
              let sourceUrl = sourceUrl,
              let sourceName = sourceName else {
            fatalError()
        }
              
        let source = Source(name: sourceName, url: sourceUrl)
        
        guard let image = image else {
            return Article(
                title: title,
                description: subtitle,
                content: content,
                url: url,
                imageUrl: nil,
                date: date,
                source: source
            )
        }
        return Article(
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

extension Article {
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
        if let image = self.image {
            managedObject.image = image
        }
        return managedObject
    }
}


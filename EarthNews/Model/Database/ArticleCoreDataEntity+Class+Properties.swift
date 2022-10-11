//
//  ArticleCoreDataEntity+CoreDataClass.swift
//  EarthNews
//
//  Created by Justina Siaulyte on 2022-10-11.
//

import UIKit
import CoreData

class ArticleCoreDataEntity: NSManagedObject {
}

extension ArticleCoreDataEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleCoreDataEntity> {
        return NSFetchRequest<ArticleCoreDataEntity>(entityName: "ArticleCoreDataEntity")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var subtitle: String?
    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var image: UIImage?
    @NSManaged public var url: URL?
    @NSManaged public var sourceUrl: URL?
    @NSManaged public var sourceName: String?
}


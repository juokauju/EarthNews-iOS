//
//  CoreDataCoordinator.swift
//  EarthNews
//
//  Created by jimi bird on 2022-10-11.
//

import UIKit
import CoreData

class CoreDataCoordinator: DatabaseCoordinating {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataMain")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error while loading persistence stores: \(error)")
            }
        }
        context = container.viewContext
    }
    
    func fetch() -> [Article] {
        let request = ArticleCoreDataEntity.fetchRequest()

        Task {
            try await context.perform { [weak self] in
                return try self?.context.fetch(request).compactMap { $0.convertToArticle() } ?? []
            }
        }
        return []
    }
    
    func create(item: Article) {
        item.convertToManagedObject(in: context)
        save()
    }
    
    func delete(item: Article) {
        let entity = item.convertToManagedObject(in: context)
        context.delete(entity)
        save()
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

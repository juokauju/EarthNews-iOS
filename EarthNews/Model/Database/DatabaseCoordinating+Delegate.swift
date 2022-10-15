//
//  DatabaseCoordinating.swift
//  EarthNews
//
//  Created by jimi bird on 2022-10-11.
//

import Foundation

protocol DatabaseCoordinating {
    associatedtype Entity
    func fetch() -> [Entity]
    func create(item: Entity)
    func delete(item: Entity)
}

extension DatabaseCoordinating {
    func fetch() -> [Entity] { return [] }
    func create(item: Entity) { }
    func delete(item: Entity) { }
}

protocol DatabaseCoordinatorDelegate: AnyObject {
    func didCreate(item: Article)
    func didDelete(item: Article)
}

extension DatabaseCoordinatorDelegate {
    func didCreate(item: Article) { }
    func didDelete(item: Article) { }
}

enum DatabaseActionIconString: String {
    case save = "square.and.arrow.up.circle"
    case delete = "trash.circle"
}


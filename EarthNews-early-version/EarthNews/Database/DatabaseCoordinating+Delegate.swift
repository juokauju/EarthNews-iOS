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
    func didCreate(item: ArticleWithImage)
    func didDelete(item: ArticleWithImage)
}

extension DatabaseCoordinatorDelegate {
    func didCreate(item: ArticleWithImage) { }
    func didDelete(item: ArticleWithImage) { }
}

enum DatabaseActionIconString: String {
    case save = "bookmark"
    case delete = "trash"
}


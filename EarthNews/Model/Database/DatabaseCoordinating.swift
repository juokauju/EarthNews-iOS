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
    func fetch() -> [Entity] { }
    func create(item: Entity) { }
    func delete(item: Entity) { }
}

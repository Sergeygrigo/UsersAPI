//
//  Todos.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 27.11.2024.
//

import Foundation

// MARK: - Todo
struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias Todos = [Todo]

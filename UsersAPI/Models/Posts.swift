//
//  Posts.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 06.11.2024.
//

import Foundation

// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Posts = [Post]

//
//  Comments.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 27.11.2024.
//

import Foundation

// MARK: - Comment
struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Comments = [Comment]

//
//  Albums.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 06.11.2024.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album]

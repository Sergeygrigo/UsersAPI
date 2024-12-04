//
//  Photos.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 27.11.2024.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias Photos = [Photo]

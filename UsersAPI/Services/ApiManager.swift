//
//  APIManager.swift
//  UsersAPI
//
//  Created by Сергей Григоренко on 06.11.2024.
//

import Foundation

enum ApiType {
    
    case getAlbums
    case getComments
    case getPhotos
    case getPosts
    case getTodos
    case getUsers
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var headers: [String: String] {
        switch self {
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getAlbums:
            return "albums"
        case .getComments:
            return "comments"
        case .getPhotos:
            return "photos"
        case .getPosts:
            return "posts"
        case .getTodos:
            return "todos"
        case .getUsers:
            return "users"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    func sendRequest<T: Decodable>(apiType: ApiType, completion: @escaping (T) -> Void) {
        let request = apiType.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                print("FAIL 1")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let httpResponse = try decoder.decode(T.self, from: data)
                completion(httpResponse)
            }
            catch {
                print("FAIL 2")
            }
        }
        task.resume()
    }
}

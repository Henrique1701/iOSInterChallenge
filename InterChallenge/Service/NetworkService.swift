//
//  NetworkService.swift
//  InterChallenge
//
//  Created by José Henrique Fernandes Silva on 14/10/21.
//

import Foundation
import Alamofire

enum ModelType {
    case user
    case post
    case comment
    case album
    case photo
}

struct NetworkService {
    
    static let shared = NetworkService()
    
    func getUsers(completion: @escaping ([User]?, Error?) -> ()) {
        self.getData(type: ModelType.user) { data, error in
            do {
                if let data = data {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(users, nil)
                    return
                } else {
                    completion(nil, error)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func getPosts(userId: Int, completion: @escaping ([Post]?, Error?) -> ()) {
        self.getData(userId, type: ModelType.post) { data, error in
            do {
                if let data = data {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts, nil)
                    return
                } else {
                    completion(nil, error)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func getComments(postId: Int, completion: @escaping ([Comment]?, Error?) -> ()) {
        self.getData(postId, type: ModelType.comment) { data, error in
            do {
                if let data = data {
                    let comments = try JSONDecoder().decode([Comment].self, from: data)
                    completion(comments, nil)
                    return
                } else {
                    completion(nil, error)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func getAlbuns(userId: Int, completion: @escaping ([Album]?, Error?) -> ()) {
        self.getData(userId, type: ModelType.album) { data, error in
            do {
                if let data = data {
                    let albums = try JSONDecoder().decode([Album].self, from: data)
                    completion(albums, nil)
                    return
                } else {
                    completion(nil, error)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func getPhotos(albumId: Int, completion: @escaping ([Photo]?, Error?) -> ()) {
        self.getData(albumId, type: ModelType.photo) { data, error in
            do {
                if let data = data {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    completion(photos, nil)
                    return
                } else {
                    completion(nil, error)
                    return
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    func downloadImageData(url: String, completion: @escaping (Data?, Error?) -> ()) {
        AF.download(url).responseData { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            switch response.result {
            case .success(let data):
                completion(data, nil)
                return
            default:
                break
            }
        }
    }
    
    private func getData(_ id: Int = 0, type: ModelType, completion: @escaping (Data?, Error?) -> ()) {
        let url = generateUrl(type: type, id: id)
        AF.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
                return
            }
            if let data = response.data {
                completion(data, nil)
                return
            }
        }
    }
    
    private func generateUrl(type: ModelType, id: Int) -> String {
        switch type {
        case ModelType.user:
            return "https://jsonplaceholder.typicode.com/users"
        case ModelType.post:
            return "https://jsonplaceholder.typicode.com/posts?userId=\(id)"
        case ModelType.comment:
            return "https://jsonplaceholder.typicode.com/comments?postId=\(id)"
        case ModelType.album:
            return "https://jsonplaceholder.typicode.com/albums?postId=\(id)"
        case ModelType.photo:
            return "https://jsonplaceholder.typicode.com/photos?albumId=\(id)"
        }
    }
}

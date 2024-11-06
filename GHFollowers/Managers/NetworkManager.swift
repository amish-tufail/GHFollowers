//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Amish on 06/11/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL: String = "https://api.github.com/users/"
    private init() {}
    
    func getFollowers(for userName: String, page: Int, completion: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(userName)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                completion(nil, "The data recieved from the server is invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, "The data recieved from the server is invalid. Please try again.")
            }
            
        }
        
        task.resume()
    }
}
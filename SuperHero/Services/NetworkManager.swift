//
//  NetworkManager.swift
//  SuperHero
//
//  Created by abd ul’Karim 📚 on 10.06.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(dataType: T.Type, url: URL?, completion: @escaping(T) -> Void) {
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let superHeroes = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(superHeroes.self)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchImage(from url: String, completion: @escaping(Data) -> Void) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
            completion(imageData)
            }
        }        
    }
}

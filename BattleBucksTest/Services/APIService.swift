//
//  APIService.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//

// Services/APIService.swift
import Foundation


enum APIError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
    
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed(let e): return e.localizedDescription
        case .invalidResponse: return "Invalid response from server"
        case .decodingError(let e): return "Decoding error: \(e.localizedDescription)"
        }
    }
}


protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
}


final class APIService: APIServiceProtocol {
    private let session: URLSession
    
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw APIError.invalidURL
        }
        
        
        do {
            let (data, response) = try await session.data(from: url)
            
            
            guard let http = response as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
                throw APIError.invalidResponse
            }
            
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Post].self, from: data)
            } catch {
                throw APIError.decodingError(error)
            }
        } catch {
            throw APIError.requestFailed(error)
        }
    }
}

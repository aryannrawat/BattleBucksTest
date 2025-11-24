//
//  FavoritesManager.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// ViewModels/FavoritesManager.swift
import Foundation


@MainActor
final class FavoritesManager: ObservableObject {
    @Published private(set) var favorites: Set<Int>
    private let key = "favoritePosts"
    
    
    init() {
        if let data = UserDefaults.standard.array(forKey: key) as? [Int] {
            favorites = Set(data)
        } else {
            favorites = []
        }
    }
    
    
    func isFavorite(_ post: Post) -> Bool {
        favorites.contains(post.id)
    }
    
    
    func toggle(_ post: Post) {
        if favorites.contains(post.id) {
            favorites.remove(post.id)
        } else {
            favorites.insert(post.id)
        }
        save()
    }
    
    
    private func save() {
        let arr = Array(favorites)
        UserDefaults.standard.set(arr, forKey: key)
    }
}

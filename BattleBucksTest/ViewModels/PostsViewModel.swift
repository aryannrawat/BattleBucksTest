//
//  PostsViewModel.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// ViewModels/PostsViewModel.swift
import Foundation


@MainActor
final class PostsViewModel: ObservableObject {
    @Published private(set) var posts: [Post] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    private let apiService: APIServiceProtocol
    
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    
    var filteredPosts: [Post] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return posts
        } else {
            return posts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    func loadPosts() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetched = try await apiService.fetchPosts()
            posts = fetched
        } catch {
            if let apiError = error as? APIError {
                errorMessage = apiError.errorDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
        isLoading = false
    }
    
    
    func refresh() async {
        await loadPosts()
    }
}

//
//  FavoritesView.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favorites: FavoritesManager
    @StateObject private var vm = PostsViewModel()

    var favoritePosts: [Post] {
        vm.posts.filter { favorites.isFavorite($0) }
    }

    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = vm.errorMessage {
                VStack(spacing: 12) {
                    Text(error)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        Task { await vm.loadPosts() }
                    }
                }
                .padding()
            } else if favoritePosts.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "heart.slash")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    Text("No favorites yet")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(favoritePosts) { post in
                    NavigationLink(value: post) {
                        PostRowView(post: post)
                            .environmentObject(favorites)
                    }
                }
                .listStyle(.plain)
                .navigationDestination(for: Post.self) { post in
                    PostDetailView(post: post)
                        .environmentObject(favorites)
                }
            }
        }
        .navigationTitle("Favorites")
        .task {
            if vm.posts.isEmpty {
                await vm.loadPosts()
            }
        }
    }
}

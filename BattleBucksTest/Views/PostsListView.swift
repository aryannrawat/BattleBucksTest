//
//  PostsListView.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// Views/PostsListView.swift
import SwiftUI


struct PostsListView: View {
    @StateObject private var vm = PostsViewModel()
    @EnvironmentObject private var favorites: FavoritesManager
    
    
    var body: some View {
        VStack {
            // Search field
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search by title...", text: $vm.searchText)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            if vm.isLoading {
                ProgressView("Loading posts...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = vm.errorMessage {
                VStack(spacing: 12) {
                    Text(error).multilineTextAlignment(.center)
                    Button("Retry") {
                        Task { await vm.loadPosts() }
                    }
                }
                .padding()
            } else {
                List(vm.filteredPosts) { post in
                    NavigationLink(value: post) {
                        PostRowView(post: post)
                            .environmentObject(favorites)
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    await vm.refresh()
                }
                .navigationDestination(for: Post.self) { post in
                    PostDetailView(post: post)
                        .environmentObject(favorites)
                }
            }
        }
        .navigationTitle("Posts")
        .task {
            // Load once when view appears
            if vm.posts.isEmpty {
                await vm.loadPosts()
            }
        }
    }
}

//
//  PostDetailView.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// Views/PostDetailView.swift
import SwiftUI


struct PostDetailView: View {
    let post: Post
    @EnvironmentObject private var favorites: FavoritesManager
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(post.title)
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: { favorites.toggle(post) }) {
                    Image(systemName: favorites.isFavorite(post) ? "heart.fill" : "heart")
                        .foregroundColor(favorites.isFavorite(post) ? .red : .gray)
                }
                .buttonStyle(.plain)
            }
            
            
            Text(post.body)
                .font(.body)
                .padding(.top, 8)
            
            
            Spacer()
        }
        .padding()
        .navigationTitle("Post")
        .navigationBarTitleDisplayMode(.inline)
    }
}

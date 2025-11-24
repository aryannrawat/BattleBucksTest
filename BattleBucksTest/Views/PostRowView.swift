//
//  PostRowView.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// Views/PostRowView.swift
import SwiftUI


struct PostRowView: View {
    let post: Post
    @EnvironmentObject private var favorites: FavoritesManager
    
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                Text("User: \(post.userId)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: { favorites.toggle(post) }) {
                Image(systemName: favorites.isFavorite(post) ? "heart.fill" : "heart")
                    .imageScale(.large)
                    .foregroundColor(favorites.isFavorite(post) ? .red : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
    }
}

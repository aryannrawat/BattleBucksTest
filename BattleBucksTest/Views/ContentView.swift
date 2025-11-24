//
//  ContentView.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// Views/ContentView.swift
import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                PostsListView()
            }
            .tabItem {
                Label("Posts", systemImage: "list.bullet")
            }
            
            
            NavigationStack {
                FavoritesView()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
    }
}

//
//  PostsAppApp.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//


// PostsAppApp.swift
import SwiftUI

 
@main
struct BattleBusksTest: App {
    @StateObject private var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesManager)
        }
    }
}

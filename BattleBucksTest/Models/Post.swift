//
//  Post.swift
//  BattleBucksTest
//
//  Created by Aryan iOS Device  on 21/11/25.
//

import Foundation

struct Post: Codable,Identifiable,Hashable {
   
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}


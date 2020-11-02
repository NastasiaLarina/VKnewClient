//
//  User.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 19.10.2020.
//
 import Foundation

struct User {
    var name: String
    var avatar: String
    var photos: [String] = []
   // Mark: - Fake
    
    static var randomOne: User {
        return User(name: Lorem.fullName,
                    avatar: String(Int.random(in: 1...18)),
                    photos: (1...6).map { _ in String(Int.random(in: 1...18)) }
       )
    }
    static var randomMany: [User] {
        return (1...18).map { _ in User.randomOne }
    }
    
}


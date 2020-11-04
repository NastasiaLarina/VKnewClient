//
//  User.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 19.10.2020.
//
 import Foundation

struct User {
    var firstName: String
    var lastName: String
    var avatar: String
    var photos: [String]
    
    var fullName: String {
        return "\(lastName) \(firstName)"
    }
    
   // Mark: - Fake
    
    static var randomOne: User {
        return User(firstName: Lorem.firstName,
                    lastName: Lorem.lastName,                    avatar: String(Int.random(in: 1...18)),
                    photos: (1...6).map { _ in String(Int.random(in: 1...18)) }
       )
    }
    static var randomMany: [User] {
        return (1...18).map { _ in User.randomOne }
    }
    
}


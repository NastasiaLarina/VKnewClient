//
//  NewsItem.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 09.11.2020.
//

import Foundation

struct NewsItem {
    var author: User
    var postDate: String
    var text: String
    var photos: [String]
    
    static let fake: [NewsItem] = (1...10).map {_ in
        NewsItem(author: User.randomOne, postDate: "09.11.2020", text: Lorem.sentences(5), photos: Self.generatePhotos(count: Int.random(in: 0...10)))
        
    }
    static func generatePhotos(count: Int) -> [String] {
        guard count > 0 else { return [] }
        return (1...count).compactMap {
            _ in String(Int.random(in: 1...20))
        }
    }
}

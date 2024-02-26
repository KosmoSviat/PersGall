//
//  PostItem.swift
//  PersGall
//
//  Created by Sviatoslav Samoilov on 22.02.2024.
//

import Foundation

class PostDate: Identifiable {
    // MARK: - Properties
    let id = UUID().uuidString
    let items: [PostItem]
    let date: Date
    
    // MARK: - Init
    init(items: [PostItem], date: Date) {
        self.items = items
        self.date = date
    }
    
    // MARK: - Methods
    static func getMockData() -> [PostDate] {
        [
            PostDate(items: [
            PostItem(photos: ["img1", "img2"],
                     comments: nil,
                     tags: ["Home", "Nature"],
                     description: ["Lorem ipsum dolor sit amet, consectetur adipisicing elit"]),
            PostItem(photos: ["img3"],
                     comments: nil,
                     tags: ["Home", "Nature", "Education", "Work", "Game"],
                     description: ["tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"]),
            PostItem(photos: ["img4"],
                     comments: nil,
                     tags: ["Home", "Nature", "Education", "Work", "Game"],
                     description: ["tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"])
            ], date: Date()),
            
            PostDate(items: [
            PostItem(photos: ["img5", "img6"],
                     comments: nil,
                     tags: ["Home", "Nature"],
                     description: ["Lorem ipsum dolor sit amet, consectetur adipisicing elit"]),
            PostItem(photos: ["img7"],
                     comments: nil,
                     tags: ["Home", "Nature", "Education", "Work", "Game"],
                     description: ["tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"])
            ], date: Date().addingTimeInterval(-86400)),
            
            PostDate(items: [
            PostItem(photos: ["img8", "img9"],
                     comments: nil,
                     tags: ["Home", "Nature"],
                     description: ["Lorem ipsum dolor sit amet, consectetur adipisicing elit"]),
            PostItem(photos: ["img10"],
                     comments: nil,
                     tags: ["Home", "Nature", "Education", "Work", "Game"],
                     description: ["tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"])
            ], date: Date().addingTimeInterval(-172800))
        ]
    }
}

class PostItem: Identifiable {
    // MARK: - Properties
    let id = UUID().uuidString
    let photos: [String]
    let comments: [Comment]?
    let tags: [String]?
    let description: [String]?
    let isFavorite: Bool = false
    
    // MARK: - Init
    init(photos: [String], comments: [Comment]?, tags: [String]?, description: [String]?) {
        self.photos = photos
        self.comments = comments
        self.tags = tags
        self.description = description
    }
}

class Comment: Identifiable {
    // MARK: - Properties
    let id = UUID().uuidString
    let date: Date
    let comment: String
    
    // MARK: - Init
    init(date: Date, comment: String) {
        self.date = date
        self.comment = comment
    }
}

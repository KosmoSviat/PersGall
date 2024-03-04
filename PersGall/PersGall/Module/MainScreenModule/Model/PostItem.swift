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
                         description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                         date: Date()),
                PostItem(photos: ["img3"],
                         comments: nil,
                         tags: ["Home", "Nature", "Education", "Work", "Game"],
                         description: "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                         date: Date()),
                PostItem(photos: ["img4"],
                         comments: nil,
                         tags: ["Home", "Nature", "Education", "Work", "Game"],
                         description: "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                         date: Date()),
            ], date: Date()),
            
            PostDate(items: [
                PostItem(photos: ["img5", "img6"],
                         comments: nil,
                         tags: ["Home", "Nature"],
                         description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                         date: Date()),
                PostItem(photos: ["img7"],
                         comments: nil,
                         tags: ["Home", "Nature", "Education", "Work", "Game"],
                         description: "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                         date: Date())
            ], date: Date().addingTimeInterval(-86400)),
            
            PostDate(items: [
                PostItem(photos: ["img8", "img9"],
                         comments: nil,
                         tags: ["Home", "Nature"],
                         description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                         date: Date()),
                PostItem(photos: ["img10"],
                         comments: nil,
                         tags: ["Home", "Nature", "Education", "Work", "Game"],
                         description: "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                         date: Date())
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
    let description: String?
    let isFavorite: Bool
    let date: Date
    
    // MARK: - Methods
    static func getMockItems() -> [PostItem] {
        [
            PostItem(photos: ["img1", "img2"],
                     comments: nil,
                     tags: ["Home", "Природа"],
                     description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                     isFavorite: true,
                     date: Date()),
            PostItem(photos: ["img2", "img3"],
                     comments: nil,
                     tags: ["Home", "Природа"],
                     description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                     isFavorite: true,
                     date: Date()),
            PostItem(photos: ["img3", "img1"],
                     comments: nil,
                     tags: ["Home", "Природа"],
                     description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                     isFavorite: true,
                     date: Date())
        ]
    }
    
    // MARK: - Init
    init(photos: [String], comments: [Comment]?, tags: [String]?, description: String?, isFavorite: Bool = false, date: Date) {
        self.photos = photos
        self.comments = comments
        self.tags = tags
        self.description = description
        self.isFavorite = isFavorite
        self.date = date
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

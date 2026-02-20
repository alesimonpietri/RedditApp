//
//  RedditPost.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

struct RedditPost: Identifiable, Equatable {
    let id: String
    let title: String
    let author: String
    let dateMDY: String
    let thumbnailURL: URL?
    let numComments: Int
    let subreddit: String
}

extension RedditPost {
    static func mock() -> RedditPost {
        RedditPost(
            id: "123",
            title: "A post title",
            author: "Author Name",
            dateMDY: "12/34/56",
            thumbnailURL: URL(string: "https://external-preview.redd.it/bjVqeGhwN3NmaWtnMcn7nceSG3J9sgDWFEvrG1RrLlsjbSbedb2GleQAYJaw.png?width=140&amp;height=140&amp;crop=1:1,smart&amp;format=jpg&amp;auto=webp&amp;s=cfa081f97d010cd0efac22cc758993f93c23d717"),
            numComments: 100,
            subreddit: "swift"
        )
    }

    static func mockList(count: Int = 10) -> [RedditPost] {
        (0..<count).map { _ in RedditPost.mock() }
    }
}

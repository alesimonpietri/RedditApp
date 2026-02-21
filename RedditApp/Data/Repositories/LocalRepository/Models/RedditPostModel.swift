//
//  RedditPostModel.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

@Model
final class RedditPostModel {
    @Attribute(.unique) var id: String
    var title: String
    var author: String
    var created: Date
    var thumbnailURL: URL?
    var numComments: Int
    var subreddit: String

    init(id: String, title: String, author: String, created: Date, thumbnailURL: URL?, numComments: Int, subreddit: String) {
        self.id = id
        self.title = title
        self.author = author
        self.created = created
        self.thumbnailURL = thumbnailURL
        self.numComments = numComments
        self.subreddit = subreddit
    }
}

//
//  RedditListResponse.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

struct RedditListResponse: Decodable {
    let kind: String
    let data: RedditListDataResponse
}

// MARK: - RedditListDataResponse

struct RedditListDataResponse: Decodable {
    let after: String
    let children: [RedditChildDataResponse]
}

// MARK: - RedditChildDataResponse

struct RedditChildDataResponse: Decodable {
    let data: RedditPostResponse
}

// MARK: - RedditPostDataResponse

struct RedditPostResponse: Decodable {
    let id: String
    let title: String
    let author: String
    let createdUTC: TimeInterval
    let numComments: Int
    let subreddit: String
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case createdUTC = "created_utc"
        case numComments = "num_comments"
        case subreddit
        case thumbnail
    }
}

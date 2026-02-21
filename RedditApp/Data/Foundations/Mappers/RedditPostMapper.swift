//
//  RedditPostMapper.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

struct RedditPostMapper {

    // MARK: - From Response

    static func map(response: RedditListResponse) -> [RedditPost] {
        response.data.children.map { map(response: $0.data) }
    }

    static func map(response: RedditPostResponse) -> RedditPost {
        RedditPost(id: response.id,
                   title: response.title,
                   author: response.author,
                   created: Date(timeIntervalSince1970: response.createdUTC),
                   thumbnailURL: map(thumbnail: response.thumbnail),
                   numComments: response.numComments,
                   subreddit: response.subreddit)
    }

    static func map(thumbnail: String? ) -> URL? {
        guard let thumbnail = thumbnail else { return nil }
        let urlString = thumbnail.replacingOccurrences(of: "&amp;", with: "&")
        return URL(string: urlString)
    }

    // MARK: From Model

    static func map(from post: RedditPostModel) -> RedditPost {
        RedditPost(id: post.id,
                   title: post.title,
                   author: post.author,
                   created: post.created,
                   thumbnailURL: post.thumbnailURL,
                   numComments: post.numComments,
                   subreddit: post.subreddit)
    }
}

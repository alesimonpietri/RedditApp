//
//  RedditPostModelMapper.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation

struct RedditPostModelMapper {
    static func map(from post: RedditPost) -> RedditPostModel {
        RedditPostModel(id: post.id,
                        title: post.title,
                        author: post.author,
                        created: post.created,
                        thumbnailURL: post.thumbnailURL,
                        numComments: post.numComments,
                        subreddit: post.subreddit)
    }
}

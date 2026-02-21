//
//  GetTopPostsUseCase+Instantiate.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

// MARK: - Instantiate

extension GetTopPosts {
    static func instantiate(context: ModelContext) -> GetTopPosts {
        GetTopPosts(redditRepo: RedditRepositoryImpl.instantiate(), localRepo: LocalRepositoryImpl.instantiate(context: context))
    }

    static func mock() -> GetTopPosts {
        struct RedditRepositoryMock: RedditRepository {
            func fetchPosts(after: String?) async throws -> (after: String?, posts: [RedditPost]) {
                (nil, RedditPost.mockList())
            }
        }
        return GetTopPosts(redditRepo: RedditRepositoryMock(), localRepo: LocalRepositoryImpl.mock())
    }
}

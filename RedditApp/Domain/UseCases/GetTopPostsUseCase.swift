//
//  GetTopPostsUseCase.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

protocol GetTopPostsUseCase {
    func execute(after: String?) async throws -> (after: String?, posts: [RedditPost])
}

final class GetTopPosts: GetTopPostsUseCase {
    private let redditRepo: RedditRepository

    init(redditRepo: RedditRepository) {
        self.redditRepo = redditRepo
    }
    
    func execute(after: String?) async throws -> (after: String?, posts: [RedditPost]){
        try await redditRepo.fetchPosts(after: after)
    }
}

// MARK: - Instantiate

extension GetTopPosts {
    static func instantiate() -> GetTopPosts {
        GetTopPosts(redditRepo: RedditRepositoryImpl.instantiate())
    }

    static func mock() -> GetTopPosts {
        struct RedditRepositoryMock: RedditRepository {
            func fetchPosts(after: String?) async throws -> (after: String?, posts: [RedditPost]) {
                (nil, RedditPost.mockList())
            }
        }
        return GetTopPosts(redditRepo: RedditRepositoryMock())
    }
}

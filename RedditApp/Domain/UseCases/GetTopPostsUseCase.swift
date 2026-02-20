//
//  GetTopPostsUseCase.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

protocol GetTopPostsUseCase {
    func execute() async throws -> [RedditPost]
}

final class GetTopPosts: GetTopPostsUseCase {
    private let redditRepo: RedditRepository

    init(redditRepo: RedditRepository) {
        self.redditRepo = redditRepo
    }
    
    func execute() async throws -> [RedditPost] {
        try await redditRepo.fetchPosts()
    }
}

// MARK: - Instantiate

extension GetTopPosts {
    static func instantiate() -> GetTopPosts {
        GetTopPosts(redditRepo: RedditRepositoryImpl.instantiate())
    }

    static func mock() -> GetTopPosts {
        struct RedditRepositoryMock: RedditRepository {
            func fetchPosts() async throws -> [RedditPost] {
                RedditPost.mockList()
            }
        }
        return GetTopPosts(redditRepo: RedditRepositoryMock())
    }
}

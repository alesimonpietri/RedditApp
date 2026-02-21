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
    private let localRepo: LocalRepository

    init(redditRepo: RedditRepository, localRepo: LocalRepository) {
        self.redditRepo = redditRepo
        self.localRepo = localRepo
    }
    
    func execute(after: String?) async throws -> (after: String?, posts: [RedditPost]) {
        let result = try await redditRepo.fetchPosts(after: after)
        if after == nil {
            try await localRepo.save(posts: result.posts)
        }
        return result
    }
}

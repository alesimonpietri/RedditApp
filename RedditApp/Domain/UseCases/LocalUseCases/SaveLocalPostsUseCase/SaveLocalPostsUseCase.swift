//
//  SaveLocalPostsUseCase.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation

protocol SaveLocalPostsUseCase {
    func execute(posts: [RedditPost]) async throws
}

final class SaveLocalPosts: SaveLocalPostsUseCase {
    private let localRepo: LocalRepository

    init(localRepo: LocalRepository) {
        self.localRepo = localRepo
    }

    func execute(posts: [RedditPost]) async throws {
        try await localRepo.save(posts: posts)
    }
}

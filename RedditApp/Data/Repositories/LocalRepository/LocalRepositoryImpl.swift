//
//  LocalRepositoryImpl.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

final class LocalRepositoryImpl: LocalRepository {
    private let context: ModelContext

    public init(context: ModelContext) { self.context = context }

    func fetchAll() async throws -> [RedditPost] {
        let fd = FetchDescriptor<RedditPostModel>(
            sortBy: [SortDescriptor(\.created, order: .reverse)]
        )
        return try context.fetch(fd).map { RedditPostMapper.map(from: $0) }
    }
    
    func search(text: String) async throws -> [RedditPost] {
        RedditPost.mockList()
    }
    
    func save(posts: [RedditPost]) async throws {
        let postsModel: [RedditPostModel] = posts.map { RedditPostModelMapper.map(from: $0) }
        postsModel.forEach { context.insert($0) }
        try context.save()
    }
}

// MARK: - Instantiate

extension LocalRepositoryImpl {
    static func instantiate(context: ModelContext) -> LocalRepositoryImpl {
        LocalRepositoryImpl(context: context)
    }

    static func mock() -> LocalRepository {
        struct LocalRepositoryMock: LocalRepository {
            func fetchAll() async throws -> [RedditPost] {
                RedditPost.mockList()
            }

            func search(text: String) async throws -> [RedditPost] {
                RedditPost.mockList(count: 2)
            }

            func save(posts: [RedditPost]) async throws {
                // not needed to implement
            }
        }

        return LocalRepositoryMock()
    }
}

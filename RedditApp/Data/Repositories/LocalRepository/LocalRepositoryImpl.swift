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
        RedditPost.mockList()
    }
    
    func search(text: String) async throws -> [RedditPost] {
        RedditPost.mockList()
    }
    
    func save(post: [RedditPost]) async throws {
        // not implemented yet
    }
}

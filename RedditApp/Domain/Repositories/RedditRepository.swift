//
//  RedditRepository.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

protocol RedditRepository {
    func fetchPosts(after: String?) async throws -> (after: String?, posts: [RedditPost])
}

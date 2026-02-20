//
//  RedditRepository.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

protocol RedditRepository {
    func fetchPosts() async throws -> [RedditPost]
}

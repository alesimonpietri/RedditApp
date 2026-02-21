//
//  LocalRepository.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation

protocol LocalRepository {
    func fetchAll() async throws -> [RedditPost]
    func search(text: String) async throws -> [RedditPost]
    func save(post: [RedditPost]) async throws
}

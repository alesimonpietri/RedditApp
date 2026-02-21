//
//  GetLocalPostsUseCase.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

protocol GetLocalPostsUseCase {
    func execute() async throws -> [RedditPost]
}

final class GetLocalPost: GetLocalPostsUseCase {
    private let localRepo: LocalRepository

    init(localRepo: LocalRepository) {
        self.localRepo = localRepo
    }
    
    func execute() async throws -> [RedditPost] {
        return try await localRepo.fetchAll()
    }
}

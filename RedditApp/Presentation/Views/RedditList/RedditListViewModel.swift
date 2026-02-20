//
//  RedditListViewModel.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

@Observable
final class RedditListViewModel {
    var posts: [RedditPost] = []

    // MARK: - UseCases

    @ObservationIgnored
    private let getTopPostUseCase: GetTopPostsUseCase

    init(getTopPostUseCase: GetTopPostsUseCase) {
        self.getTopPostUseCase = getTopPostUseCase
    }

    func fetchPost() async {
        do {
            posts = try await getTopPostUseCase.execute()
        } catch {
            print("error fetching posts: \(error)")
        }
    }
}

// MARK: - Instantiate

extension RedditListViewModel {
    static func instantiate() -> RedditListViewModel {
        RedditListViewModel(getTopPostUseCase: GetTopPosts.instantiate())
    }

    static func mock() -> RedditListViewModel {
        RedditListViewModel(getTopPostUseCase: GetTopPosts.mock())
    }
}

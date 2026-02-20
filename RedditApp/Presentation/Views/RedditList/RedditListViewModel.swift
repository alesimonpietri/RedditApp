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

    func fetchPost() async {
        posts = RedditPost.mockList()
    }
}

// MARK: - Instantiate

extension RedditListViewModel {
    static func instantiate() -> RedditListViewModel {
        RedditListViewModel()
    }

    static func mock() -> RedditListViewModel {
        RedditListViewModel()
    }
}

//
//  RedditListViewModel+Instantiate.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

// MARK: - Instantiate

extension RedditListViewModel {
    static func instantiate(context: ModelContext) -> RedditListViewModel {
        RedditListViewModel(getTopPostUseCase: GetTopPosts.instantiate(context: context),
                            getLocalPostsUseCase: GetLocalPost.instantiate(context: context),
                            saveLocalPostsUseCase: SaveLocalPosts.instantiate(context: context))
    }

    static func mock() -> RedditListViewModel {
        RedditListViewModel(getTopPostUseCase: GetTopPosts.mock(),
                            getLocalPostsUseCase: GetLocalPost.mock(),
                            saveLocalPostsUseCase: SaveLocalPosts.mock())
    }
}

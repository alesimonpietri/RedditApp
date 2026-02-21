//
//  SaveLocalPostsUseCase+Instantiate.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

extension SaveLocalPosts {
    static func instantiate(context: ModelContext) -> SaveLocalPosts {
        SaveLocalPosts(localRepo: LocalRepositoryImpl.instantiate(context: context))
    }

    static func mock() -> SaveLocalPosts {
        SaveLocalPosts(localRepo: LocalRepositoryImpl.mock())
    }
}

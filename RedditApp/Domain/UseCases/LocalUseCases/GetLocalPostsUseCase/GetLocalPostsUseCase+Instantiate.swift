//
//  GetLocalPostsUseCase+Instantiate.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation
import SwiftData

// MARK: - Instantiate

extension GetLocalPost {
    static func instantiate(context: ModelContext) -> GetLocalPost {
        GetLocalPost(localRepo: LocalRepositoryImpl.instantiate(context: context))
    }

    static func mock() -> GetLocalPost {
        return GetLocalPost(localRepo: LocalRepositoryImpl.mock())
    }
}

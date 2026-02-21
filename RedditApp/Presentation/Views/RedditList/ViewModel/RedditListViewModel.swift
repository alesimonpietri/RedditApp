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

    @ObservationIgnored private let getTopPostUseCase: GetTopPostsUseCase
    @ObservationIgnored private let getLocalPostsUseCase: GetLocalPostsUseCase
    @ObservationIgnored private let saveLocalPostsUseCase: SaveLocalPostsUseCase

    init(getTopPostUseCase: GetTopPostsUseCase,
         getLocalPostsUseCase: GetLocalPostsUseCase,
         saveLocalPostsUseCase: SaveLocalPostsUseCase) {
        self.getTopPostUseCase = getTopPostUseCase
        self.getLocalPostsUseCase = getLocalPostsUseCase
        self.saveLocalPostsUseCase = saveLocalPostsUseCase
    }

    func fetchPost() async {
        do {
            posts = try await getTopPostUseCase.execute()
        } catch {
            print("error fetching posts: \(error)")
        }
    }
}

//
//  RedditListViewModel.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

@MainActor
@Observable
final class RedditListViewModel {
    var posts: [RedditPost] = []
    var isLoadingMore: Bool = false { didSet { print("isLoading: \(isLoadingMore)") } }
    @ObservationIgnored private var after: String?

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

    func fetchInitalPage() async {
        after = nil
        do {
            let result = try await getTopPostUseCase.execute(after: nil)
            after = result.after
            posts = result.posts
        } catch {
            print("error fetching posts: \(error)")
        }
    }

    func fetchNextPage(post: RedditPost) async {
        guard post.id == posts.last?.id else { return }
        guard !isLoadingMore else { return }
        isLoadingMore = true
        defer { isLoadingMore = false }
        do {
            let result = try await getTopPostUseCase.execute(after: after)
            after = result.after
            posts.append(contentsOf: result.posts)
        } catch {
            print("error fetching posts: \(error)")
        }
    }
}

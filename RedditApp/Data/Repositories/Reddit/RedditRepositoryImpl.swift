//
//  RedditRepositoryImpl.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

final class RedditRepositoryImpl: RedditRepository {
    func fetchPosts(after: String?) async throws -> (after: String?, posts: [RedditPost]) {
        var components = URLComponents(string: "https://www.reddit.com/top.json")!
        var items: [URLQueryItem] = [
            .init(name: "t", value: "week"),
            .init(name: "limit", value: "25")
        ]

        if let after {
            items.append(.init(name: "after", value: after))
        }
        components.queryItems = items

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200...299).contains(http.statusCode) else {
            throw APIError.httpStatus(http.statusCode, body: String(data: data, encoding: .utf8))
        }

        let redditListResponse = try JSONDecoder().decode(RedditListResponse.self, from: data)
        let posts = RedditPostMapper.map(response: redditListResponse)
        return (redditListResponse.data.after, posts)
    }
}

// MARK: - Instantiate

extension RedditRepositoryImpl {
    static func instantiate() -> RedditRepositoryImpl {
        RedditRepositoryImpl()
    }
}

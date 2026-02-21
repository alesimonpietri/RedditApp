//
//  RedditRepositoryImpl.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

final class RedditRepositoryImpl: RedditRepository {
    func fetchPosts() async throws -> [RedditPost] {
        var components = URLComponents(string: "https://www.reddit.com/top.json")!
        components.queryItems = [
            .init(name: "t", value: "week"),
            .init(name: "limit", value: "25")
        ].compactMap { $0 }

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
        return RedditPostMapper.map(response: redditListResponse)
    }
}

// MARK: - Instantiate

extension RedditRepositoryImpl {
    static func instantiate() -> RedditRepositoryImpl {
        RedditRepositoryImpl()
    }
}

//
//  APIError.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 20/2/26.
//

import Foundation

// MARK: - Errors

public enum APIError: Error, LocalizedError {
    case invalidResponse
    case httpStatus(Int, body: String?)

    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response."
        case .httpStatus(let code, let body):
            return "HTTP \(code). Body: \(body ?? "<nil>")"
        }
    }
}

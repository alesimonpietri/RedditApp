//
//  AlertErrorMapper.swift
//  RedditApp
//
//  Created by Alejandro Simonpietri on 21/2/26.
//

import Foundation

struct AlertErrorMapper {
    static func map(_ error: Error) -> AlertError {
        if error is CancellationError { return SomethingWentWrongError() }

        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost:
                return NoInternetError()
            case .timedOut, .cannotFindHost, .cannotConnectToHost, .dnsLookupFailed:
                return SomethingWentWrongError()
            default:
                return SomethingWentWrongError()
            }
        }

        if error is DecodingError {
            return MapError()
        }

        return SomethingWentWrongError()
    }
}

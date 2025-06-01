//
//  NetworkError.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

import SwiftUI
import Foundation

public enum NetworkError: Error, Equatable {
   case badURL(_ error: String)
   case apiError(code: Int, error: String)
   case invalidJSON(_ error: String)
   case unauthorized(code: Int, error: String)
   case badRequest(code: Int, error: String)
   case serverError(code: Int, error: String)
   case noResponse(_ error: String)
   case unableToParseData(_ error: String)
   case unknown(code: Int, error: String)
}

enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError( _ description: String)
    case urlSessionFailed(_ error: URLError)
    case timeOut
    case unknownError
}

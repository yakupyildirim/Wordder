//
//  APIClient.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

import SwiftUI

import Foundation
import Combine

struct APIClient {
        
    static var networkDispatcher: NetworkDispatcher = NetworkDispatcher()
    
    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    static func dispatch<R: Request>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: Project.baseURL.rawValue) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
            
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
}

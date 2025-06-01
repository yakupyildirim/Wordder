//
//  APIRouter.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

import Foundation

class APIRouter {
    
    struct GetEnglishWords: Request {
        typealias ReturnType = EnglishWordModel
        var path: String = Project.englishWords.rawValue
        var method: HTTPMethod = .get
        var body: [String : Any]?
        var queryParams: [String: Any]?
        var isTokenRequire: Bool = false
        init(){
            queryParams = ["length": "3"]
        }
    }
}

//
//  BaseResponseModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 8.01.2024.
//

import Foundation

protocol BaseResponseModel: Codable {
    associatedtype DataModel
    var processId: String? { get }
    var status: Status? { get }
    var data: DataModel? { get }
}

struct Status: Codable {
    let code: Int?
    let isSucceed: Bool?
    let message, internalMessage: String?
    let validationMessages: [ValidationMessage]?
}

struct ValidationMessage: Codable {
    let field, message: String?
}

struct EmptyData: Codable{
}

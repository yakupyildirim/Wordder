//
//  LoginModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 8.01.2024.
//


// MARK: - LoginModel
struct LoginModel: BaseResponseModel {
    let processId: String?
    let status: Status?
    let data: LoginData?
}

// MARK: - DataClass
struct LoginData: Codable {
    let loginUser: LoginUser?
}

// MARK: - LoginUser
struct LoginUser: Codable {
    let token, department, email, fullName: String?
    let userID, userName, title, direktorateID: String?
    let waSessionExpireSeceonds: Int?
    let phoneNumber, userIDWithE, userIDWith6: String?

    enum CodingKeys: String, CodingKey {
        case token, department, email, fullName
        case userID = "userId"
        case userName, title
        case direktorateID = "direktorateId"
        case waSessionExpireSeceonds, phoneNumber
        case userIDWithE = "userIdWithE"
        case userIDWith6 = "userIdWith6"
    }
}

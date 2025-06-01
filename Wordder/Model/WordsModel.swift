//
//  WordsModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 10.01.2024.
//

import Foundation

struct WordsModel: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case word
        case length
        case languageId
    }
    
    var id = UUID()
    var word: String
    var length: Int
    var languageId: Int
}

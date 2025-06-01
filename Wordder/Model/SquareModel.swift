//
//  SquareModel.swift
//  Wordder
//
//  Created by yusuf on 4.01.2024.
//

import Foundation
import SwiftUI

struct SquareModel: Hashable{
    var character: String = ""
    var guessCharacter: String = ""
    var backgroundColor: Color = .white//Color("squareGray")
    var borderColor: Color = .black
    var isActive: Bool = true
    var scale: Double = 0.1
}

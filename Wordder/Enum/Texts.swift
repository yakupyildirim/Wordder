//
//  TextEnum.swift
//  Meditation
//
//  Created by yusuf on 23.12.2023.
//

import Foundation

struct Texts{
    enum onboarding: String{
       case oneTextName = ""//"Track your activity"
       case twoTextName = " "//"Plan to meditate"
       case threeTextName = "  "//"Daily insights"
       case oneTextDescription = "If the letter is in the green box, its place is correct."
       case twoTextDescription = "If the letter is in the yellow box, its location is different."
       case threeTextDescription = "If all the letters are in the correct place, the operation is successful."
       func getText() -> String{
           return self.rawValue
       }
    }
    
    enum authentication: String{
       case signIn = "SIGIN"
       case signUp = "SIGNUP"
       func getText() -> String{
           return self.rawValue
       }
    }
}

struct ConstModels {
   static let languageOptions = ["English", "Türkçe"]
}


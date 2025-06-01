//
//  Images.swift
//  Meditation
//
//  Created by yusuf on 23.12.2023.
//

import Foundation

struct Images{
    enum onboarding:String{
       case one = "onboarding_mid_one"
       case two = "onboarding_mid_two"
       case three = "onboarding_mid_three"
       func getImage() -> String{
           return self.rawValue
       }
   }
    
}

//
//  OnboardingModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 18.01.2024.
//

import SwiftUI
import Foundation

struct OnboardingModel: Identifiable, Equatable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = OnboardingModel(name: Texts.onboarding.oneTextName.getText(),
                                           description:Texts.onboarding.oneTextDescription.getText(), imageUrl: Images.onboarding.one.getImage(),tag: 0)
    
    static var onboardingPages: [OnboardingModel] =
              [OnboardingModel(name: Texts.onboarding.oneTextName.getText(),
                               description:Texts.onboarding.oneTextDescription.getText(), imageUrl: Images.onboarding.one.getImage(),tag: 0),
               OnboardingModel(name: Texts.onboarding.twoTextName.getText(),
                               description:Texts.onboarding.twoTextDescription.getText(), imageUrl: Images.onboarding.two.getImage(), tag: 1),
               OnboardingModel(name: Texts.onboarding.threeTextName.getText(),
                               description:Texts.onboarding.threeTextDescription.getText(), imageUrl: Images.onboarding.three.getImage(), tag: 2)]
}

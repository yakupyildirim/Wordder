//
//  OnboardingItem.swift
//  Meditation
//
//  Created by yusuf on 23.12.2023.
//

import SwiftUI

struct OnboardingItem: View {
    var onboardingModel: OnboardingModel
    
    var body: some View {
            VStack(spacing:20){
                Image(onboardingModel.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                    .padding(.bottom, 30)
                Text(onboardingModel.name)
                    .bold()
                    .font(.title)
                Text(onboardingModel.description)
                    .bold()
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.center)
        }.padding([.top], 100)
         .foregroundColor(.white)
    }
}

struct OnboardingItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingItem(onboardingModel: OnboardingModel.samplePage)
    }
}

//
//  Splash.swift
//  Meditation
//
//  Created by yusuf on 22.12.2023.
//

import SwiftUI

struct Splash: View {
    @State private var size = 0.2
    @State private var opacity = 0.2
    @State private var isActive = false
    

    var body: some View {
        NavigationStack{
            ZStack{
             Color.navi
             .ignoresSafeArea()
                VStack{
                    if isActive {
                        Language()
                    }else{
                        Image("logo")
                            .padding([.bottom], 64)
                    }
                }
                .scaleEffect(size)
                .opacity(opacity)
            }.onAppear(perform: {
                Audio.playSound("splash3")
                withAnimation(.easeInOut(duration: 1.2)){
                    self.size = 1.0
                    self.opacity = 1.0
                }
                self.gotoOnboarding(time: 4)
            })
        }
    }

    

    func gotoOnboarding(time: Double){
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)){
            self.isActive = true
        }
    }
}



struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

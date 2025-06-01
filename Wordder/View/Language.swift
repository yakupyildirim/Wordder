//
//  Language.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 21.02.2024.
//

import SwiftUI

struct Language: View {
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("backgroundBlueTop"), Color("backgroundBlueBottom")]), startPoint: .top, endPoint: .bottom)
                VStack(spacing: 100){
                    
                    Text("Language")
                     .font(.system(size: 18, weight: .bold))
                     .foregroundColor(.white)
                    
                    
                    NavigationLink {
                        Menu()
                    } label: {
                        Image("enFlag")
                    }.simultaneousGesture(TapGesture().onEnded {
                        Audio.playSound("buttonClick3")
                    })
                    
                    NavigationLink {
                        Menu()
                    } label: {
                        Image("trFlag")
                    }.simultaneousGesture(TapGesture().onEnded {
                        Audio.playSound("buttonClick3")
                    })
             
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language()
    }
}

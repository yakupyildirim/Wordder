//
//  BottomMenu.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 29.02.2024.
//

import SwiftUI

struct BottomMenu: View {
    @Binding var wordLength: Int
    var body: some View {
        
        VStack(spacing: 16) {
            Text("Word Length")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)

            HStack(spacing: 20) {
                Button(action: {
                    if wordLength > 4 { wordLength -= 1 }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
    
                    
                }

                Text("\(wordLength)")
                    .font(.title)
                    .frame(width: 40)
                    .foregroundColor(.white)

                Button(action: {
                    if wordLength < 6 { wordLength += 1 }
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                }
            }

          
        }
        
        
        /*
        VStack{
            Text("Word Length")
                .font(.system(size: 18, weight: .light))
            .foregroundColor(.white)
            
            HStack{
                Image("vs")
                    .padding([.leading], 24)
                Spacer()
                Stepper(wordLength: $wordLength)
                Spacer()
                
                NavigationLink {
                    Setting()
                } label: {
                    Image("setting")
                        .padding([.trailing], 24)
                }.simultaneousGesture(TapGesture().onEnded {
                    Audio.playSound("buttonClick3")
                })
    
                
            }
        }
        
        */

    }
}

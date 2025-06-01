//
//  ScoreAndInfo.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 29.02.2024.
//

import SwiftUI

struct Info: View {
    var body: some View {
            HStack{
                Image("info")
                    .padding([.leading], 24)
                
                Spacer()
                Image("home")
                Spacer()
                
                HStack{
                    Text("12")
                        .font(.system(size: 54, weight: .light))
                        .foregroundColor(.white)
                    Image("score")
                        .padding([.trailing], 24)
                }
            }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info().background(Color.navi)
    }
}

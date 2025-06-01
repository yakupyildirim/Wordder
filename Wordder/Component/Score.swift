//
//  Score.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 15.01.2024.
//

import SwiftUI

struct Score: View {
    var body: some View {
        ZStack{
            HStack{
                Text("50")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Text("P")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .italic()
                
              
            }.padding(8)
        }.background(.black)
         .cornerRadius(8)
         .padding([.top], -350)
    }
}

struct Score_Previews: PreviewProvider {
    static var previews: some View {
        Score()
    }
}

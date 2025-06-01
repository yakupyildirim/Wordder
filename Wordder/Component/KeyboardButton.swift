//
//  KeyboardButton.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 6.01.2024.
//

import SwiftUI

struct KeyboardButton: View {
    let key: String
    
    var body: some View {
        ZStack{
            if key == "DELETE" {
                Image("trash3")
                .resizable()
                .frame(width: 44, height: 44)
            }else{
                Rectangle()
                    .frame(width: 30, height: 48)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    //.border(.black, width: 1.5)
                    .cornerRadius(2)
       
                
                Text(key)
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .foregroundColor(Color("continueBackground"))
            }
        }
    }
}


struct KeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardButton(key: "A")
    }
}

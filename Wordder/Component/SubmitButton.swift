//
//  SubmitButton.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 7.01.2024.
//

import SwiftUI

struct SubmitButton: View {
    let key: String
    let backgroundColor: Color
    let letterColor: Color
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 300 , height: 44)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(backgroundColor)//Color("submitButtonColor"))
                .cornerRadius(4)
            
            Text(key)
                .font(.title2)
                    .bold()
                    .foregroundColor(letterColor)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(key: "SUBMIT", backgroundColor: .cyan, letterColor: .black)
    }
}

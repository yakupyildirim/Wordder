//
//  SuccessSheet.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 15.01.2024.
//

import SwiftUI

struct SuccessSheet: View {
    //var Restart: () -> Void
    
    var body: some View {
        VStack{
            Image("medal")
                .resizable()
                .frame(width: 100, height: 100)
                .padding([.bottom], -16)
            Text("You win!")
                .font(.system(size: 60, weight: .bold))
            /*
            Button(action: {
                self.Restart()
            }, label: {
                SubmitButton(key: "NEXT", backgroundColor: .black, letterColor: .white)
            })
             */
        }.presentationDetents([.height(275)])
         .frame(width: 400, height: 275)
         .background(.green)
         .interactiveDismissDisabled()
    }
}


struct SuccessSheet_Previews: PreviewProvider {
    static var previews: some View {
        SuccessSheet()//SuccessSheet(Restart: {})
    }
}


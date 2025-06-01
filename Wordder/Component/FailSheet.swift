//
//  FailSheet.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 15.01.2024.
//

import SwiftUI

struct FailSheet: View {
    //var Restart: () -> Void
    
    var body: some View {
        VStack{
            Image("fail")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .padding([.bottom], -16)
            Text("Time is over!")
                .font(.system(size: 60, weight: .bold))
            /*
            Button(action: {
                self.Restart()
            }, label: {
                SubmitButton(key: "RESTART", backgroundColor: .black, letterColor: .white)
            })
             */
        }.presentationDetents([.height(275)])
         .frame(width: 400, height: 275)
         .background(.red)
         .interactiveDismissDisabled()
    }
}


struct FailSheet_Previews: PreviewProvider {
    static var previews: some View {
        FailSheet() //FailSheet(Restart: {})
    }
}

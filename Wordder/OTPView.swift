//
//  OTPView.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 5.01.2024.
//

import SwiftUI

import SwiftUI

struct OTPView: View {
    @State var code: [String] = Array(repeating: "", count: 6)
    
    @FocusState var activeField: OTPField?

    var body: some View {
            NavigationView{
                VStack{
                    VStack{
                        Text("Verify your Mobile")
                            .font(.title)
                            .bold()
                        Text("Enter your code here")
                            .font(.body)
                            .foregroundColor(Color.gray)
                            .padding(.top, 2)
                            //.padding(.bottom, UIScreen.screenHeight/20)
                        
                        VStack{
                            OTPField()
                        }.onChange(of: code){ newValue in
                            OTPCondition(value: newValue)
                        }
                         Button(action: {
                             //print("verificationId verify:::::" + verifyViewModel.verificationId)
                             //verifyViewModel.sendVerifyCode()
                             //signUpviewModel.create()
                         },label:{
                             Text("Verify Now")
                            //.LoginButtonStyle()
                         })
                
                    }
                    Spacer()
                 
                }
            }
        
    }
    

func OTPCondition(value: [String]){
    
    //move next
    for index in 0..<5 {
        if value[index].count  == 1 && activeStateForIndex(index: index) == activeField{
            activeField = activeStateForIndex(index: index + 1)
        }
    }
    
    
    //move back
    for index in 1...5 {
        if value[index].isEmpty  && !value[index - 1].isEmpty {
            activeField = activeStateForIndex(index: index - 1)
        }
    }
    
    
    for index in 0..<6 {
        if value[index].count > 1 {
            //verifyViewModel.code[index] = String(value[index].last!)
        }
    }
}

@ViewBuilder
func OTPField() -> some View{
    HStack(spacing: 8){
        ForEach(0..<6, id: \.self){ index in
            VStack(spacing: 8){
                TextField("", text: $code[index])
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .focused($activeField, equals: activeStateForIndex(index: index))
                    .background(Circle()
                        .fill( (activeField == activeStateForIndex(index: index)
                               || !code[index].isEmpty ) ? .white: .gray.opacity(0.3))
                        .frame(width: 12, height: 12))
                
   
                
                
            }.frame(width: 40)
        }
    }.padding(.bottom)
}

func activeStateForIndex(index: Int) -> OTPField{
    switch index{
    case 0: return .field1
    case 1: return .field2
    case 2: return .field3
    case 3: return .field4
    case 4: return .field5
    default: return .field6
    }
}
}

enum OTPField {
case field1
case field2
case field3
case field4
case field5
case field6
}


struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}

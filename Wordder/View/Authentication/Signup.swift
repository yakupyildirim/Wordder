//
//  Signup.swift
//  Meditation
//
//  Created by yusuf on 1.01.2024.
//

/*
import SwiftUI

struct Signup: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var userName = "jacob"
    @State var email = "y_yildirim14"
    @State var password = "Omer218."
    @State var progressViewShow = false
    @State private var selected = 1
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                HStack{
                    Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .heavy))
                    TextField("UserName", text: $userName)
                    //.defaultProperty()
                        .padding()
                }.padding(.horizontal)
                Divider().padding(.horizontal)
                
                HStack{
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 24, weight: .heavy))
                    TextField("Email", text: $email)
                    //.defaultProperty()
                        .padding()
                }.padding(.horizontal)
                Divider().padding(.horizontal)
                
                HStack{
                    Image(systemName: "lock.fill")
                        .font(.system(size: 24, weight: .heavy))
                    SecureField("Password", text: $password)
                    //.defaultProperty()
                        .padding()
                }.padding(.horizontal)
                Divider().padding(.horizontal)
                
                HStack{
                    RadioButtonGroup(isHorizontal: true){ selected in
                        print("Selected Gender id: \(selected)")
                    }
                }.padding(40)
     
            
                
                VStack(spacing: 24){
                    Button(action: {
                        //viewModel.signin()
                    },label:{
                        Text("LOGIN").ContinueButtonStyle(.black, Buttons.width.login.rawValue)
                    })
                    
                    Button(action: {
                        //viewModel.signin()
                    },label:{
                        GoogleButtonLabel()
                    })
                    
                    
                    Button(action: {
                        //viewModel.signin()
                    },label:{
                        FacebookButtonLabel()
                    })
                }
                
          
                
                Spacer()
                
                VStack{
                    Image("onboarding_bottom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            
            }.ignoresSafeArea()
        }
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
*/

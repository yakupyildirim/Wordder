//
//  Login.swift
//  Meditation
//
//  Created by yusuf on 23.12.2023.
//
/*
 import SwiftUI
 
 struct Login: View {
 
 @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
 @State var email = "y_yildirim14"
 @State var password = "Omer218."
 @State var progressViewShow = false
 
 var body: some View {
 NavigationStack{
 VStack{
 Spacer()
 HStack{
 Image(systemName: "person.fill")
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
 
 Button(action: {
 //showForgotPassword.toggle()
 }, label: {
 Text("Forgot Password ?")
 .font(.footnote)
 .padding()
 })
 /*
  .sheet(isPresented: $showForgotPassword){
  ForgotPassword()
  }
  */
 }
 
 VStack(spacing: 24){
 Button(action: {
 //viewModel.signin()
 },label:{
 Text("LOGIN").ContinueButtonStyle(.black, Buttons.width.login.rawValue)
 })
 
 Button(action: {
 //viewModel.signin()
 },label:{
 //GoogleButtonLabel()
 })
 
 
 Button(action: {
 //viewModel.signin()
 },label:{
 //FacebookButtonLabel()
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
 
 struct Login_Previews: PreviewProvider {
 static var previews: some View {
 Login()
 }
 }
 */

//
//  LoginViewModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 8.01.2024.
//


import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var user: LoginModel?
    @Published var isAuthenticateUser: Bool = false
    @Published var AccessToken: String = ""
    
    var cancelable: Set<AnyCancellable> = []

    //Post Method
    func getUserInfo(username: String, password:String) {
        APIClient.dispatch(
            APIRouter.GetToken(body:APIParameters.LoginParams(username: username, password: password)))
        .sink { _ in
        } receiveValue: { [weak self] user in
            Log.info("userinfo-> \(user)")
            self?.user = user
            
            if  user.data != nil
                    && user.data?.loginUser != nil
                    && user.data?.loginUser?.token != nil{
                
                self?.isAuthenticateUser = true
                let data = user.data?.loginUser?.token ?? ""
                KeychainManager.standard.save(Data(data.utf8), service: Project.keyChainService.rawValue, account: Project.keyChainAccount.rawValue) //todo
            }else{
                self?.isAuthenticateUser = false
            }
           
        }.store(in: &cancelable)
    }
}

//
//  VerifyViewModel.swift
//  Wordder
//
//  Created by YAKUP YILDIRIM on 5.01.2024.
//

import Foundation
import Combine

protocol VerifyViewModel {
    func getVerifyCode(phone: String)
    func sendVerifyCode()
    var hasError: Bool { get }
    var code: [String] { get }
}

final class VerifyViewModelImpl: ObservableObject {
    //@Published var state: ResponseState = .na
    @Published var hasError: Bool = false
    @Published var code: [String] = Array(repeating: "", count: 6)
    @Published var verificationId: String = ""
    
}

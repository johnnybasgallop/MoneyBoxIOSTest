//
//  LoginViewModel.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import Foundation
import SwiftUI
import Networking

final class LoginViewModel: ObservableObject {
    let dataprovider = DataProvider()
    let sessionManager = SessionManager()

    @AppStorage("token") var token: String = ""
    @AppStorage("savedUsername") var savedUsername : String = ""
    @AppStorage("savedPassword") var savedPassword : String = ""
    @AppStorage("loginPin") var loginPin : String = ""
    
    @Published var userInfo  : UserInfo = UserInfo(name: "", loggedin: false)
    @Published var wrongPin : Bool = false
    @Published var pin : String = ""
    @Published var LoginError : Bool = false
    
    
    func loginUserWithEmailAndPassword(username: String, password: String, completion: @escaping (String) -> Void){
        
        let req = LoginRequest(email: username, password: password)
        
            var success = false
        
        dataprovider.login(request: req){ result in
            
            switch result {

            case .success(let response):
                
                withAnimation{
                    self.savedUsername = username
                    self.savedPassword = password
                    self.token = response.session.bearerToken
                }
               
                 
                guard let name = response.user.firstName else{return}
                
                self.userInfo.name = name
                
                self.sessionManager.setUserToken(response.session.bearerToken)
                
                completion("successfully logged user in")
                
                
                
            case.failure(let response):
                print("\(response.localizedDescription)")
                completion("failed to login user")
                self.LoginError = true
            }
            
        }
        
        
    }

    
    
    
    func logout()  {
        self.token = ""
        self.savedUsername = ""
        self.savedPassword = ""
        self.loginPin = ""
        self.userInfo.loggedin = false
        self.wrongPin = false
        self.pin = ""
    }
    
 
    
    
    
}

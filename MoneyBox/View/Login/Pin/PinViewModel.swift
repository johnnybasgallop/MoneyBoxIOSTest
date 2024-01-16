//
//  PinViewModel.swift
//  MoneyBox
//
//  Created by johnny basgallop on 11/01/2024.
//

import Foundation
import SwiftUI

extension LoginViewModel {
    
    func loginUserWithPin(pin: String, completion: @escaping (Bool) -> Void){
        if pin == loginPin{
            
            loginUserWithEmailAndPassword(username: self.savedUsername, password: self.savedPassword){success in
                if success == "successfully logged user in"{
                    withAnimation{
                        self.userInfo.loggedin = true
                    }
                    completion(true)
                }
                
                else
                {
                   completion(false)
                }
            }
            
        }
          
        else if pin != loginPin{
            userInfo.loggedin = false
            completion(false)
        }
    }
    
    func handleLoginPinInput(number: String){
        if self.pin.count <= 2 && number != "delete.fill" {
            self.pin.append(number)
        }
        
        else if self.pin.count >= 3 && number != "delete.fill"{
            self.pin.append(number)
            
            loginUserWithPin(pin: self.pin) { completion in
                if completion == true {
                    self.wrongPin = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                        self.pin = ""
                    }
                }
                
                if completion == false{
                    self.pin = ""
                    self.wrongPin = true
                }
            }
        }
        
        if number == "delete.fill" {
            self.pin.popLast()
        }
    }
    
    
    func handleCreationPinInput(number: String) {
        if self.pin.count <= 2 && number != "delete.fill" {
            self.pin.append(number)
        }
        
        else if self.pin.count >= 3 && number != "delete.fill"{
            self.pin.append(number)
            self.loginPin = self.pin
            self.userInfo.loggedin = true
        }
        
        if number == "delete.fill" {
            self.pin.popLast()
        }
    }
    
    
}

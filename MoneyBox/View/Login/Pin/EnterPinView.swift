//
//  EnterPinView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 11/01/2024.
//

import SwiftUI

struct EnterPinView : View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        VStack{
            Text(loginViewModel.wrongPin ? "Incorrect pin, Try again!" :"Enter your pin!").foregroundColor(loginViewModel.wrongPin ? .red : .white)
                .font(.system(size: 20, weight: .bold))
            
            pinIndicators()
            
            numberGrid(creation: false).offset(y: screenWidth * 0.25)
        }
        .frame(width: screenWidth, height: screenHeight)
        .background(Color("primaryColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct pinIndicators : View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        HStack{
            ForEach(1...4, id: \.self){number in
                Circle().foregroundColor(loginViewModel.pin.count >= number ? .black : .white)
                    .frame(width: screenWidth * 0.06)
                    .padding()
                
            }
        }
    }
}


struct numberGrid : View {
    
    var creation : Bool
    var body: some View {
        
        if creation {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 30){
                ForEach(1...9, id: \.self){value in
                    digitButton(number: "\(value)")
                }
                digitButton(number: "delete.fill")
                digitButton( number: "0").padding()
                
            }.frame(width: screenWidth * 0.85)
            
        }
        
        else if creation == false {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 30){
                ForEach(1...9, id: \.self){value in
                    loginDigitButton(number: "\(value)")
                }
                loginDigitButton(number: "delete.fill")
                loginDigitButton(number: "0").padding()
                
            }.frame(width: screenWidth * 0.85)
        }
        
    }
    
    
}







struct loginDigitButton : View {
    
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var number : String
    
    var body: some View {
        Button(action: {
            loginViewModel.handleLoginPinInput(number: number)
        }) {
            
            VStack{
                if number.count > 1 || number == "delete.fill" {
                    Image(systemName: "delete.left")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
                
                else{
                    Text(number)
                        .font(.title)
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color("primaryColor"))
                        .background(Color.white)
                        .cornerRadius(30)
                }
                
            }
        }
    }
    
}
#Preview {
    EnterPinView()
}

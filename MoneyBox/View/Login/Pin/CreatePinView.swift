//
//  CreatePinView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 11/01/2024.
//

import SwiftUI

struct CreatePinView: View {
    
    var body: some View {
        VStack{
            Text("Create your pin!").foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
            
            pinIndicators()
            
            numberGrid(creation: true).offset(y: screenWidth * 0.25)
        }
        .frame(width: screenWidth, height: screenHeight)
        .background(Color("primaryColor"))
        .edgesIgnoringSafeArea(.all)
    }
}





struct digitButton : View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var number : String
    
    var body: some View {
        Button(action: {
            loginViewModel.handleCreationPinInput(number: number)
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




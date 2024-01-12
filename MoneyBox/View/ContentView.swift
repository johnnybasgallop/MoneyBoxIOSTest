//
//  ContentView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import SwiftUI
import Networking


//Getting screen height and width values for quick and easy responsive sizing
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width

struct ContentView: View {
    @StateObject var loginViewModel = LoginViewModel()
    var body: some View {
        VStack{
            if loginViewModel.loggedIn == false{
                
                if loginViewModel.savedUsername.isEmpty {
                    LoginView().environmentObject(loginViewModel)
                }
                
                else if loginViewModel.savedUsername.isEmpty == false{
                    PinView().environmentObject(loginViewModel)
                }
                
            }
            
            else if loginViewModel.loggedIn {
                DashboardView().environmentObject(loginViewModel)
            }
        }
      
    }
}




#Preview {
    ContentView()
}

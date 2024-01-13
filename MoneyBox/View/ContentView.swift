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
    @StateObject var dashboardViewModel = DashboardViewModel()
    var body: some View {
        VStack{
            if loginViewModel.userInfo.loggedin == false{
                
                if loginViewModel.savedUsername.isEmpty {
                    LoginView().environmentObject(loginViewModel)
                }
                
                else if loginViewModel.savedUsername.isEmpty == false{
                    PinView().environmentObject(loginViewModel)
                }
                
            }
            
            else if loginViewModel.userInfo.loggedin {
                
                DashboardView()
                    .environmentObject(loginViewModel)
                    .environmentObject(dashboardViewModel)
                
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                            dashboardViewModel.fetchUserData()
                        }
                    }
                   
                   
                  
            }
        }
      
    }
}




#Preview {
    ContentView()
}

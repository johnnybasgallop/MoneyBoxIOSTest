//
//  DashboardView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import SwiftUI
import Networking
struct DashboardView: View {
    
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel

    var body: some View {
        VStack{
            TopNav()
            Spacer()
            AccountList()
            Spacer()
        }
        
       
    }
    
}

struct TopNav : View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    var body: some View {
        HStack{
            Text("MoneyBox").font(.system(size: 35, weight: .semibold)).foregroundColor(Color("primaryColor"))
            
            Spacer()
            
            Button(action: {
                loginViewModel.logout()
            }, label: {
                Text("logout")
            })
        }
        .padding(.vertical, 10).padding(.horizontal, 25)
        
    }
}


struct AccountList : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    
    var body: some View {
        VStack{
            ForEach(dashboardViewModel.accounts, id: \.self){account in
                    StocksAndSharesISACard()
            }
        }.onAppear{
            print("accounts after load: \(dashboardViewModel.accounts)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                print("current accounts:  \(dashboardViewModel.accounts)")
            }
            
        }
    }
}


struct StocksAndSharesISACard : View {
//    User naviagtion to transition to the the add money screens
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: screenWidth * 0.85, height: screenWidth * 0.45)
            .foregroundColor(.red)
    }
}

struct LISACard : View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: screenWidth * 0.85, height: screenWidth * 0.45)
            .foregroundColor(.blue)
    }
}

#Preview {
    DashboardView().environmentObject(DashboardViewModel())
}


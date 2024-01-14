//
//  TopNavView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 14/01/2024.
//

import SwiftUI

struct TopNav : View {
    var body: some View {
        HStack{
            Text("MoneyBox").font(.system(size: 35, weight: .semibold)).foregroundColor(Color("primaryColor"))
            Spacer()
            LogoutButton()
        }
        .padding(.vertical, 10).padding(.horizontal, 25)
    }
}



struct LogoutButton : View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    @State var logoutAlertShowing: Bool = false
    
    var body: some View {
        Button(action: {
            logoutAlertShowing = true
        }, label: {
            Image(systemName: "rectangle.portrait.and.arrow.right").rotationEffect(.degrees(180), anchor: .center).font(.system(size: 20)).padding(.trailing, 5).foregroundColor(Color("primaryColor"))
        })
        
        .alert(isPresented: $logoutAlertShowing) {
            Alert(
                title: Text("Logout of account"),
                message: Text("By confirming you will logout of your Moneybox account"),
                primaryButton: .default(Text("Logout")) {
                    loginViewModel.logout()
                },
                secondaryButton: .cancel(Text("Cancel")) {
                    logoutAlertShowing = false
                }
            )
        }
    }
}

#Preview {
    TopNav()
}

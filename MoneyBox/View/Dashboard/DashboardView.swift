//
//  DashboardView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import SwiftUI
import Networking
struct DashboardView: View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    let dataProvider = DataProvider()
    
    var body: some View {
        VStack{
            Button(action: {
                loginViewModel.logout()
            }, label: {
                Text("logout")
            })
            
            Button(action: {
                dataProvider.fetchProducts(){result in
                    switch result{
                    case .success(let response):
                        print(response)
                        
                    case .failure(let response):
                        print(response)
                         
                    }
                }
            }, label: {
                Text("get Data")
            })
        }
    }
}

#Preview {
    DashboardView()
}

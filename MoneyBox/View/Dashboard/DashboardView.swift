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
        NavigationView{
            VStack{
                TopNav().padding(.bottom, 20)
                
                if dashboardViewModel.loading == true{
                    ProgressView().frame(width: screenWidth, height: screenHeight * 0.75)
                }
                
                else if dashboardViewModel.loading == false{
                    ScrollView(showsIndicators: false){
                        Details()
                        Spacer()
                        AccountList()
                        Spacer()
                    }
                    
                }
            }
        }
    }
    
}


struct Details : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        let totalPlanValueFormatted = dashboardViewModel.roundUpDouble(value: dashboardViewModel.totalPlanValue, places: 2)
        
        HStack{
            VStack(alignment: .leading){
                Text("Hello, \(loginViewModel.userInfo.name)").font(.system(size: 35, weight: .bold)).foregroundColor(.black)
                
                VStack(alignment: .leading){
                    Text("total plan value").font(.system(size: 17, weight: .semibold)).foregroundColor(.gray).padding(.bottom, 0.5)
                    Text("£\(totalPlanValueFormatted)").font(.system(size: 35, weight: .bold)).foregroundColor(.black)
                }.padding(.top, 10)
                
            }.padding(.horizontal, 25)
            
            Spacer()
        }.padding(.bottom, 30)
    }
}




struct AccountList : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        VStack{
            ForEach(dashboardViewModel.accounts, id: \.self){account in
                AccountCard(id: account.id, title: account.name, type: account.type, planValue: account.planValue, moneyBox: account.moneyBox, totalContributions: account.totalContributions, totalEarnings: account.totalEarnings, totalEarningsAsPercentage: account.totalEarningsAsPercentage, interestRate: account.interestRate)
                
            }
        }
    }
}






#Preview {
    DashboardView()
        .environmentObject(LoginViewModel())
        .environmentObject(DashboardViewModel())
}


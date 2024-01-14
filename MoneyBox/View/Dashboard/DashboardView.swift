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
            TopNav().padding(.bottom, 20)
            
            if dashboardViewModel.loading == true{
                ProgressView().frame(width: screenWidth, height: screenHeight * 0.75)
            }
            
            else if dashboardViewModel.loading == false{
                ScrollView(showsIndicators: false){
                    TopDetails().padding(.bottom, 30)
                    Spacer()
                    AccountList()
                    Spacer()
                }
            }
            
        }
        
        
    }
    
}

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



struct TopDetails :View {
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
        }
        
    }
}


struct AccountList : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var body: some View {
        VStack{
            ForEach(dashboardViewModel.accounts, id: \.self){account in
                StocksAndSharesISACard(title: account.name, type: account.type, planValue: account.planValue, moneyBox: account.moneyBox)
            }
        }
    }
}


struct StocksAndSharesISACard : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    
    var title : String
    var type: String
    var planValue : Double
    var moneyBox : Double
    
    
    var body: some View {
        
        let planValueFormatted = dashboardViewModel.roundUpDouble(value: planValue, places: 2)
        let moneyBoxFormatted = dashboardViewModel.roundUpDouble(value: moneyBox, places: 2)
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: screenWidth * 0.9, height: screenWidth * 0.53)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0, y: 4)
            
            Button(action: {
                print("pressed")
            }, label: {
                VStack(alignment: .leading){
                    
                    Text("\(title)").font(.system(size: 20, weight: .bold)).foregroundColor(.black)
                    
                    HStack{
                        Image(systemName: "info.circle").foregroundColor(.gray)
                        Text("\(type)").foregroundColor(.gray)
                    }.padding(.top, 1)
                    
                    
                    
                    Text("£\(planValueFormatted)").font(.system(size: 30, weight: .bold)).foregroundColor(.black).padding(.top, 1)
                    
                    
                    
                    HStack{
                        
                        Text("🏦  £\(moneyBoxFormatted)").font(.system(size: 25, weight: .semibold)).foregroundColor(.black)
                            .padding(.top, 1)
                        Spacer()
                        Image(systemName: "arrow.right").foregroundColor(.black).font(.system(size: 25))
                    }.frame(width: screenWidth * 0.75)
                }
                .padding(.top, 20)
                .padding(.leading, 22)
            })
            
            
            
            
            
            
        }
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
    DashboardView()
        .environmentObject(LoginViewModel())
        .environmentObject(DashboardViewModel())
}


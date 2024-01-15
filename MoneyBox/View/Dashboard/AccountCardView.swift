//
//  AccountCardVIew.swift
//  MoneyBox
//
//  Created by johnny basgallop on 14/01/2024.
//

import SwiftUI
import Networking


struct AccountCard : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    
    var id: Int
    var title : String
    var type: String
    var planValue : Double
    var moneyBox : Double
    var totalContributions : Int?
    var totalEarnings : Double?
    
    var totalEarningsAsPercentage : Double?
    var interestRate : String?
    
    var body: some View {
        
        let planValueFormatted = dashboardViewModel.roundUpDouble(value: planValue, places: 2)
        let moneyBoxFormatted = dashboardViewModel.roundUpDouble(value: moneyBox, places: 2)
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: screenWidth * 0.9, height: screenWidth * 0.53)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 0, y: 4)
            
            NavigationLink(destination:
                            AddMoneyView(id: id, title: title, type: type, planValue: planValue, moneyBox: moneyBox, totalContributions: totalContributions, totalEarnings: totalEarnings, totalEarningsAsPercentage: totalEarningsAsPercentage, interestRate: interestRate).environmentObject(dashboardViewModel)){
                
                AccountData(title: title, type: type, planValue: planValueFormatted, moneyBox: moneyBoxFormatted)
            }
            
        }.padding(.bottom, 30)
        
    }
}




struct AccountData : View {
    var title : String
    var type: String
    var planValue : String
    var moneyBox : String
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("\(title)").font(.system(size: 20, weight: .bold)).foregroundColor(.black)
            
            HStack{
                Image(systemName: "info.circle").foregroundColor(.gray)
                Text("\(type)").foregroundColor(.gray)
            }.padding(.top, 1)
            
            Text("£\(planValue)").font(.system(size: 30, weight: .bold)).foregroundColor(.black).padding(.top, 1)
            
            HStack{
                Text("🏦  £\(moneyBox)").font(.system(size: 25, weight: .semibold)).foregroundColor(.black)
                    .padding(.top, 1)
                Spacer()
                Image(systemName: "arrow.right").foregroundColor(.black).font(.system(size: 25))
            }.frame(width: screenWidth * 0.75)
        }
        .padding(.top, 20)
        .padding(.leading, 22)
    }
}



#Preview {
    AccountCard(id: 1, title: "", type: "", planValue: 1.00, moneyBox: 1.00, totalContributions: Int(10.00), totalEarnings: 12.00, totalEarningsAsPercentage: 1.5, interestRate: "6.4%")
        .environmentObject(DashboardViewModel())
}

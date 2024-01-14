//
//  AccountCardVIew.swift
//  MoneyBox
//
//  Created by johnny basgallop on 14/01/2024.
//

import SwiftUI


struct AccountCard : View {
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
                AccountData(title: title, type: type, planValue: planValueFormatted, moneyBox: moneyBoxFormatted)
                
            })
            
        }
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
    AccountCard(title: "ISA", type: "Cash", planValue: 135.00, moneyBox: 20.00)
}

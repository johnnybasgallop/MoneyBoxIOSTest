//
//  AddMoneyView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 14/01/2024.
//

import SwiftUI

struct AddMoneyView: View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @State var moneyInput : Int = 10
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
        NavigationView{
            VStack{
                Spacer()
                StatsBox(title: title, type: type, planValue: planValue, moneyBox: moneyBox, totalContributions: totalEarnings, totalEarnings: totalEarnings, totalEarningsAsPercentage: totalEarningsAsPercentage, interestRate: interestRate).padding(.top, 70)
                
                Spacer()
                AddMoneyInput(moneyInput: $moneyInput)
                AddMoneyButton(moneyInput: $moneyInput, id: id)
            }.offset(y: -screenWidth * 0.07)
        }.navigationTitle(title).font(.system(size: 25, weight: .bold))
        
    }
}


struct StatsBox : View {
    var title : String
    var type: String
    
    var planValue : Double
    var moneyBox : Double
    
    var totalContributions : Double?
    var totalEarnings : Double?
    
    var totalEarningsAsPercentage : Double?
    var interestRate : String?
    
    var body: some View {
        
        ZStack() {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: screenWidth * 0.9, height: type == "Investment" ?  screenWidth * 0.5 : screenWidth * 0.9)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
            
            VStack(alignment: .leading){
                StringStat(tag: "Account", value: title)
                StringStat(tag: "Type", value: type)
                
                DoubleStat(tag: "Plan value", value: planValue, currency: true)
                DoubleStat(tag: "Money Box", value: moneyBox, currency: true)
                
                if let totalContributions,
                   let totalEarnings,
                   let totalEarningsAsPercentage,
                   let interestRate
                {
                    DoubleStat(tag: "Contributions", value: totalContributions, currency: true)
                    DoubleStat(tag: "Earnings", value: totalEarnings, currency: true)
                    
                    DoubleStat(tag: "Earnings %", value: totalEarningsAsPercentage, currency: false)
                    StringStat(tag: "Interest Rate", value: interestRate)
                    
                }
                
                
                
            }
            .padding(.horizontal, 20)
            .frame(width: screenWidth * 0.9, height: screenWidth * 1.15)
        }
        
        
    }
}




struct StringStat : View {
    var tag: String
    var value: String
    var body: some View {
        HStack{
            Text("\(tag)").foregroundColor(.gray).font(.system(size: 18))
            Spacer()
            Text("\(value)").font(.system(size: 20, weight: .bold))
        }.padding(.top, 1)
    }
}

struct DoubleStat : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    var tag: String
    var value: Double
    var currency : Bool
    var body: some View {
        
        let new = dashboardViewModel.roundUpDouble(value: value, places: 2)
        
        HStack{
            Text("\(tag)").foregroundColor(.gray).font(.system(size: 18))
            Spacer()
            Text("\(currency ? "£" : "")\(new)\(tag == "Earnings %" ? "%" : "")").font(.system(size: 20, weight: .bold))
        }.padding(.top, 1)
    }
}




struct AddMoneyInput : View {
    @Binding var moneyInput : Int
    var body: some View {
        
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: screenWidth * 0.8, height: screenWidth * 0.15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
            
            HStack{
                Button(action: {
                    moneyInput += 5
                }, label: {
                    Image(systemName: "plus.circle.fill").foregroundColor(Color("primaryColor"))
                })
                
                Text("£\(moneyInput)").padding(.horizontal, 45)
                
                Button(action: {
                    moneyInput -= 5
                }, label: {
                    Image(systemName: "minus.circle.fill").foregroundColor(Color("primaryColor"))
                })
                
            }
        }.padding(.bottom, 30)
    }
}


struct AddMoneyButton : View {
    @EnvironmentObject var dashboardViewModel : DashboardViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var moneyInput : Int
    var id: Int
    
    var body: some View {
        Button(action: {
            dashboardViewModel.addMoneyToBox(id: id, amount: moneyInput){ success in
                if success{
                    
                    dashboardViewModel.reloadAfterAdd(presentationMode: presentationMode)
                }
            }
        }, label: {
            Text("Add £\(moneyInput)")
                .frame(width: screenWidth * 0.8, height: screenWidth * 0.12)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
        })  .background(moneyInput >= 5  ? Color("primaryColor") : Color.gray)
            .cornerRadius(10)
            .padding(.bottom, 30)
    }
}

#Preview {
    AddMoneyView(id: 1, title: "Stocks & shares ISA", type: "Cash", planValue: 350, moneyBox: 20, totalContributions: 60, totalEarnings: 45, totalEarningsAsPercentage: 16.3, interestRate: "6.4%").environmentObject(DashboardViewModel())
}

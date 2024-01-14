//
//  DashboardViewModel.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import Foundation
import Networking

class DashboardViewModel : ObservableObject {
    let dataProvider = DataProvider()
    @Published var accounts : [InvestmentAccountModel] = []
    @Published var totalPlanValue : Double = 0.0
    @Published var loading : Bool = true

    
    func fetchUserData(completion : @escaping (Bool) -> Void) {
        dataProvider.fetchProducts(){result in
            switch result{
            case .success(let response):
                
                guard let totalPlanValue = response.totalPlanValue else {return}
                self.totalPlanValue = totalPlanValue
                
                guard let accounts = response.accounts else{return}
                guard let responses = response.productResponses else {return}
                self.handleAccountResponse(accounts: accounts, productResponses: responses){success in
                    if success{
                        print("success")
                        self.loading = false
                        completion(true)
                    }
                    
                    else if !success
                    {
                        print("failed")
                        completion(false)
                    }
                }
                
            case .failure(let response):
                print(response)
                completion(false)
            }
        }
    }
    
    
    func handleAccountResponse(accounts : [Account], productResponses: [ProductResponse], completion: @escaping (Bool) -> Void) {
        
        for account in accounts {
            
            for response in productResponses {
                
                if response.wrapperID == account.wrapper?.id{
                    if let name = account.name,
                       let value = account.wrapper?.totalValue,
                       let moneybox = response.moneybox,
                       let type = response.product?.categoryType{
                        let model = InvestmentAccountModel(name: name, type: type, planValue: value, moneyBox: moneybox)
                        
                        self.accounts.append(model)
                        
                    }
                }
                
            }
        }
        
        print("listed accounts: \(self.accounts)")
        completion(true)
    }
    
    
    
    func roundUpDouble(value: Double, places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = places
        formatter.maximumFractionDigits = places
        
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    
    
}

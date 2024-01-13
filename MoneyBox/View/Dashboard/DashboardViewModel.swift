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
    }
    
    
    func fetchUserData() {
        dataProvider.fetchProducts(){result in
            switch result{
            case .success(let response):
                
                guard let accounts = response.accounts else{return}
                guard let responses = response.productResponses else {return}
                self.handleAccountResponse(accounts: accounts, productResponses: responses){success in
                    if success{
                        print("success")
                        
                    }
                    
                    else if !success
                    {
                        print("failed")
                    }
                }
                
            case .failure(let response):
                print(response)
                 
            }
        }
    }
    
}

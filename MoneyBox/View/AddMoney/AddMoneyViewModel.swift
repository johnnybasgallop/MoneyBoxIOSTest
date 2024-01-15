//
//  AddMoneyViewModel.swift
//  MoneyBox
//
//  Created by johnny basgallop on 14/01/2024.
//

import Foundation
import Networking
import SwiftUI

extension DashboardViewModel {
    
    func addMoneyToBox(id: Int, amount: Int, completion: @escaping (Bool) -> Void){
        let model = OneOffPaymentRequest(amount: amount, investorProductID: id)
        dataProvider.addMoney(request: model){result in
            switch result{
            case .success(let response):
                completion(true)
                
            case .failure(let response):
                print("failed to add money to box")
                completion(false)
            }
        }
    }
    
    
    
    func reloadAfterAdd(presentationMode: Binding<PresentationMode>){
        self.loading = true
        self.fetchUserData(){success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
    
    
}

//
//  LifetimeISAModel.swift
//  MoneyBox
//
//  Created by johnny basgallop on 12/01/2024.
//

import Foundation

struct InvestmentAccountModel : Hashable {
    var id: Int
    var name : String
    var type: String
    var planValue : Double
    var moneyBox : Double
    var totalContributions : Int?
    var totalEarnings : Double?
    var totalEarningsAsPercentage : Double?
    var interestRate : String?
}

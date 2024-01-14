//
//  DashboardModelTests.swift
//  MoneyBoxTests
//
//  Created by johnny basgallop on 14/01/2024.
//

import XCTest
import Networking
@testable import MoneyBox

final class DashboardModelTests: XCTestCase {
    
    func testingFetchUserData(){
        let dashboardViewModel = DashboardViewModel()
        
//        Testing to see if it populates the accounts published var
        dashboardViewModel.fetchUserData(){success in
            if success{
                XCTAssertGreaterThan(dashboardViewModel.accounts.count, 0)
                XCTAssertNotNil(dashboardViewModel.accounts[0])
            }
            
            if !success{
                XCTAssertLessThan(dashboardViewModel.accounts.count, 1)
            }
        }
        
    }
    
    
    func testingRoundUpDouble() {
        let dashboardViewModel = DashboardViewModel()
        
        let input = 135.4500000
        let places = 2
        let expectedResult = "135.45"
        
        let result = dashboardViewModel.roundUpDouble(value: input, places: places)
        
        XCTAssertEqual(result, "135.45")
    }
    


}

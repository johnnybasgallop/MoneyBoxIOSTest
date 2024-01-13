//
//  LoginModelTests.swift
//  MoneyBoxTests
//
//  Created by johnny basgallop on 12/01/2024.
//

import XCTest
@testable import MoneyBox

final class LoginModelTests: XCTestCase {
    
    func testSuccessfulLoginAttempt() {
        
        let username = "test+ios2@moneyboxapp.com"
        let password = "P455word12"
        let loginViewModel = LoginViewModel()
        
        let expectation = XCTestExpectation(description: "success")
        
        var string : String = ""
        
        loginViewModel.loginUserWithEmailAndPassword(username: username, password: password){result in
            string = result
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertEqual(string, "success")
        XCTAssertEqual(loginViewModel.userInfo.name, "Peter")
            
    }
    

    
    
    
    
}

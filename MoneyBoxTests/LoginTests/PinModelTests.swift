//
//  PinModelTests.swift
//  MoneyBoxTests
//
//  Created by johnny basgallop on 12/01/2024.
//

import XCTest
@testable import MoneyBox


final class PinModelTests: XCTestCase {

    func testSuccessfulPinCreationInput(){
        let pinViewModel = LoginViewModel()
        
        pinViewModel.handleCreationPinInput(number: "1")
        XCTAssertEqual(pinViewModel.pin, "1")
        
        pinViewModel.handleCreationPinInput(number: "2")
        XCTAssertEqual(pinViewModel.pin, "12")
        
        pinViewModel.handleCreationPinInput(number: "delete.fill")
        XCTAssertEqual(pinViewModel.pin, "1")
        
        pinViewModel.handleCreationPinInput(number: "2")
        XCTAssertEqual(pinViewModel.pin, "12")
        
        pinViewModel.handleCreationPinInput(number: "3")
        XCTAssertEqual(pinViewModel.pin, "123")
        
        pinViewModel.handleCreationPinInput(number: "4")
        XCTAssertEqual(pinViewModel.pin, "1234")
        XCTAssertEqual(pinViewModel.userInfo.loggedin, true)
        
        
    }
    
    
    func testLoginInputSuccess() {
        let pinViewModel = LoginViewModel()
        pinViewModel.loginPin = "4321"
        
        pinViewModel.handleLoginPinInput(number: "4")
        XCTAssertEqual(pinViewModel.pin, "4")
        
        pinViewModel.handleLoginPinInput(number: "3")
        XCTAssertEqual(pinViewModel.pin, "43")
        
        pinViewModel.handleLoginPinInput(number: "delete.fill")
        XCTAssertEqual(pinViewModel.pin, "4")
        
        pinViewModel.handleLoginPinInput(number: "3")
        XCTAssertEqual(pinViewModel.pin, "43")
        
        pinViewModel.handleLoginPinInput(number: "2")
        XCTAssertEqual(pinViewModel.pin, "432")
        
        pinViewModel.handleLoginPinInput(number: "1")
        XCTAssertEqual(pinViewModel.pin, "4321")
        XCTAssertEqual(pinViewModel.userInfo.loggedin, true)
        XCTAssertEqual(pinViewModel.wrongPin, false)
        
        
    }
    
    
    func testLoginUserWithPinSuccess() {
        let pinViewModel = LoginViewModel()
        pinViewModel.loginPin = "1234"
        
        pinViewModel.loginUserWithPin(pin: "1234"){success in
            XCTAssertTrue(success)
            XCTAssertTrue(pinViewModel.userInfo.loggedin)
        }
        
        pinViewModel.loginUserWithPin(pin: "0000"){success in
            XCTAssertFalse(success)
            XCTAssertFalse(pinViewModel.userInfo.loggedin)
        }
    }

}

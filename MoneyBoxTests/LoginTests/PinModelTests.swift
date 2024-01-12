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
        XCTAssertEqual(pinViewModel.loggedIn, true)
        
        
    }

}

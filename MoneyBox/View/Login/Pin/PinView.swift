//
//  PinView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 10/01/2024.
//

import SwiftUI

struct PinView: View {
    
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    
    var body: some View {
        
        if loginViewModel.loginPin.isEmpty{
            CreatePinView()
        }
        
        else if loginViewModel.loginPin.isEmpty == false {
            EnterPinView()
//            CreatePinView()
        }
        
    }
}










#Preview {
    PinView().environmentObject(LoginViewModel())
}

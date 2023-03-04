//
//  LoginViewModel.swift
//  DineInTouch
//
//  Created by Chris on 04/03/2023.
//

import Foundation
import MessageUI

class LoginViewModel: ObservableObject {
    
    @Published var restaurantCode: String = ""
    @Published var email: String = ""
    @Published var isNewRestaurantPresented: Bool = false
    @Published var newCode: String = ""
    
    func generateCode() {
        let id = UUID().uuidString
        newCode = id
        DineInTouchKeyManager.shared.saveString(key: "restaurantCode", value: id)
    }

}

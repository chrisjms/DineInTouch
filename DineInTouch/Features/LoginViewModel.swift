//
//  LoginViewModel.swift
//  DineInTouch
//
//  Created by Chris on 04/03/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var restaurantCode: String = ""
    @Published var email: String = ""
    @Published var isNewRestaurantPresented: Bool = false
    @Published var password: String = ""
    
    func signUp() {
        
    }

}

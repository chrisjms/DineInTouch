//
//  AuthManagerProtocol.swift
//  DineInTouch
//
//  Created by Chris on 05/03/2023.
//

import Foundation
import RxSwift
import FirebaseAuth

protocol AuthManagerProtocol {
    
    func signUp(withEmail email: String, password: String) -> Single<AuthDataResult>
    func logIn(withEmail email: String, withPassord password: String) -> Single<AuthDataResult>
    
}

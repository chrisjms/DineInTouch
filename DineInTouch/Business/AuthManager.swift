//
//  AuthManager.swift
//  DineInTouch
//
//  Created by Chris on 05/03/2023.
//

import Foundation
import RxSwift
import FirebaseAuth

class AuthManager {
    
    func signUp(withEmail email: String, password: String) -> Single<AuthDataResult> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                    single(.failure(error))
                } else if let result = authResult {
                    single(.success(result))
                } else {
                    // add specific error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
    }
    
}

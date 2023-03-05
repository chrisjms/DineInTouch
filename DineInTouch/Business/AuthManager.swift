//
//  AuthManager.swift
//  DineInTouch
//
//  Created by Chris on 05/03/2023.
//

import Foundation
import RxSwift
import FirebaseAuth
import FirebaseFirestore

class AuthManager: AuthManagerProtocol {
    
    static let shared: AuthManager = AuthManager()
    
    func signUp(withEmail email: String, password: String) -> Single<AuthDataResult> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                    single(.failure(error))
                } else if let result = authResult {
                    print(authResult)
                    single(.success(result))
                } else {
                    // add specific error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func insertUser(restaurantId: String, userId: String) -> Single<Bool> {
        return Single.create { single in
            Firestore.firestore().collection("user").document(userId).setData([
                "restaurantId": restaurantId, "userId": userId
            ]) { error in
                if let error = error {
                    print("error inserting user")
                    single(.failure(error))
                } else {
                    print("new user successfully written")
                    single(.success(true))
                }
            }
            return Disposables.create()
        }
    }
    
    func logIn(withEmail email: String, withPassord password: String) -> Single<AuthDataResult> {
        return Single.create { single in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                    single(.failure(error))
                } else if let result = authResult {
                    print(authResult)
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

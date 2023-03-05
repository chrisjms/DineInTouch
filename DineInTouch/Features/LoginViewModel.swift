//
//  LoginViewModel.swift
//  DineInTouch
//
//  Created by Chris on 04/03/2023.
//

import Foundation
import RxSwift
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    @Published var restaurantCode: String = ""
    @Published var email: String = ""
    @Published var isNewRestaurantPresented: Bool = false
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    // if resto == nil -> create resto code resto code / user / userId
    // else -> check resto code
    func signUp() {
        if !restaurantCode.isEmpty {
            DataProviderManager.shared.checkRestaurantId(id: restaurantCode)
                .flatMap { isPresent -> Single<AuthDataResult> in
                    return AuthManager.shared.signUp(withEmail: self.email, password: self.password)
                }
                .flatMap { AuthDataResult -> Single<Bool> in
                    return AuthManager.shared.insertUser(restaurantId: self.restaurantCode, userId: AuthDataResult.user.uid)
                }
                .subscribe(onSuccess: { success in
                    print(success)
                }, onFailure: { error in
                    print(error)
                }).disposed(by: disposeBag)
        } else {
            AuthManager.shared.signUp(withEmail: email, password: password)
                .flatMap { authResult -> Single<Bool> in
                    self.restaurantCode = UUID().uuidString
                    return AuthManager.shared.insertUser(restaurantId: self.restaurantCode, userId: authResult.user.uid)
                }
                .flatMap { success in
                    return DataProviderManager.shared.insertNewRestaurant(restaurantId: self.restaurantCode)
                }
                .subscribe(onSuccess: { succes in
                    print("success")
                }, onFailure: { error in
                    print(error)
                }).disposed(by: disposeBag)
        }
    }
    
    func logIn() {
        AuthManager.shared.signUp(withEmail: email, password: password)
            .subscribe(onSuccess: { logInResult in
                print("okey")
            }, onFailure: { error in
                print("error")
            }).disposed(by: disposeBag)
    }

}

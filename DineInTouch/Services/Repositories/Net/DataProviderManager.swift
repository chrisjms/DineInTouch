//
//  DataProviderManager.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import FirebaseFirestore
import RxSwift

class DataProviderManager: DataProviderManagerProtocol {
    
    static let shared = DataProviderManager()
    private let database = Firestore.firestore()
    
    func getCommand() {
        
    }
    
    func getAllCommands() {
        
    }
    
    func insertCommand(command: Command) {
        
    }
    
    func deleteCommand(command: Command) {
        
    }
    
    func deleteAllCommands() {
        
    }
    
    func getAllDishes() {
        
    }
    
    func insertDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("dishes").document(dish.dishId).setData([
                "name": dish.name,
                "price": dish.price,
                "type": dish.type.getLocalizedKey()
            ]) { error in
                if let error = error {
                    print("error inserting dish")
                    single(.failure(error))
                } else {
                    print("new dish successfully written")
                    single(.success(true))
                }
            }
            return Disposables.create()
        }
    }
    
    func deleteDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("dishes").document(dish.dishId).delete() { error in
                if let error = error {
                    print("error deleting dish")
                    single(.failure(error))
                } else {
                    print("dish successfully deleted")
                    single(.success(true))
                }
            }
            return Disposables.create()
        }
    }
    
}

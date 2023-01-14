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
    
    func getAllDishes() -> Single<[Dish]> {
        fatalError("")
    }

    func getCommand() -> Single<Command> {
        fatalError("")
    }
    
    func getAllCommands() -> Single<[Command]> {
        fatalError("")
    }
    
    func insertCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("commands").document(command.commandId).setData([
                "creationDate": "\(command.creationDate)",
                "tableId": "\(command.tableId)",
                "dishes": Command.dishesArrayToString(dishes: command.dishes)
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
    
    func deleteCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("commands").document(command.commandId).delete() { error in
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
    
    func deleteAllCommands() -> Single<Bool> {
        return Single.create { single in
            self.database.collection("commands").getDocuments { snapshot, error in
                if let error = error {
                    single(.failure(error))
                } else if let snapshot = snapshot {
                    snapshot.documents.forEach { document in
                        self.database.collection("commands").document(document.documentID).delete() {
                            error in
                            if let error = error {
                                print("error deleting all dishes")
                                single(.failure(error))
                            } else {
                                print("all dishes successfully deleted")
                                single(.success(true))
                            }
                        }
                    }
                } else {
                    //todo add empty collection error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
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

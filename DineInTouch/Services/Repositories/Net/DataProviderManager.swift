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
        return Single.create { single in
            self.database.collection("dishes").getDocuments { snapshot, error in
                if let error = error {
                    print("error retrieving all dishes")
                    single(.failure(error))
                } else if let snapshot = snapshot {
                    var dishes: [Dish] = []
                    snapshot.documents.forEach { document in
                        let dish = Dish(dishId: document.documentID, type: Dish.DishType.fromString(dishTypeString: document["type"] as! String), name: document["name"] as! String, price: Double(document["price"] as! Double))
                        dishes.append(dish)
                    }
                    single(.success(dishes))
                } else {
                    //todo add error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
    }

    func insertNewRestaurant(restaurantId: String) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("restaurantId").addDocument(data: ["restaurantId": restaurantId])
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func checkRestaurantId(id: String) -> Single<Bool> {
        return Single.create { single in
            Firestore.firestore().collection("restaurantId").getDocuments { snapshot, error in
                if let error = error {
                    print(error)
                    single(.failure(error))
                } else if let snapshot = snapshot {
                    var isPresent: Bool = false
                    snapshot.documents.forEach { document in
                        if document.documentID == id {
                            isPresent = true
                        }
                    }
                    single(.success(isPresent))
                }
            }
            return Disposables.create()
        }
    }
    
    func getCommand(commandId: String) -> Single<Command> {
        return Single.create { single in
            self.database.collection("commands").document(commandId).getDocument { snapshot, error in
                if let error = error {
                    single(.failure(error))
                } else if let snapshot = snapshot {
                    let command = Command(commandId: commandId, tableId: Double(snapshot["tableId"] as! Double), creationDate: Double(snapshot["creationDate"] as! Double), dishes: Command.dishesStringToDishes(dishesString: snapshot["dishes"] as! String))
                    single(.success(command))
                } else {
                    //todo error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func getAllCommands() -> Single<[Command]> {
        return Single.create { single in
            self.database.collection("commands").getDocuments { snapshot, error in
                if let error = error {
                    print("error retrieving all commands")
                    single(.failure(error))
                } else if let snapshot = snapshot {
                    var commands: [Command] = []
                    snapshot.documents.forEach { document in
                        let command = Command(commandId: document.documentID, tableId: Double(document["tableId"] as! Double), creationDate: Double(document["creationDate"] as! Double), dishes: Command.dishesStringToDishes(dishesString: document["dishes"] as! String))
                        commands.append(command)
                    }
                    single(.success(commands))
                } else {
                    //todo add error
                    single(.failure(error!))
                }
            }
            return Disposables.create()
        }
    }
    
    func insertCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.database.collection("commands").document(command.commandId).setData([
                "creationDate": Double(command.creationDate),
                "tableId": Double(command.tableId),
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
    
    func insertDishes(dishes: [Dish]) -> Single<Bool> {
        return Single.create { single in
            dishes.forEach { dish in
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

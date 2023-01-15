//
//  DataProviderManagerProtocol.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol DataProviderManagerProtocol {
    
    func getCommand(commandId: String) -> Single<Command>
    func getAllCommands() -> Single<[Command]>
    func insertCommand(command: Command) -> Single<Bool>
    func deleteCommand(command: Command) -> Single<Bool>
    func deleteAllCommands() -> Single<Bool>
    func getAllDishes() -> Single<[Dish]>
    func insertDish(dish: Dish) -> Single<Bool>
    func deleteDish(dish: Dish) -> Single<Bool>
    func insertDishes(dishes: [Dish]) -> Single<Bool>
    
}

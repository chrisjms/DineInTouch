//
//  DataProviderManagerProtocol.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol DataProviderManagerProtocol {
    
    func getCommand()
    func getAllCommands()
    func insertCommand(command: Command)
    func deleteCommand(command: Command)
    func deleteAllCommands()
    func getAllDishes()
    func insertDish(dish: Dish) -> Single<Bool>
    func deleteDish(dish: Dish) -> Single<Bool>
    
}

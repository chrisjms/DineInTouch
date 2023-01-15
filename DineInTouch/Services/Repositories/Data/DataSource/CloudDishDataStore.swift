//
//  CloudDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CloudDishDataStore: DishDataStore {
    
    func saveAllDishes(dishes: [Dish]) {
        fatalError("Operation is not available !!!")
    }
    
    func saveDish(dish: Dish) {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalDishes() -> Single<[Dish]> {
        fatalError("Operation is not available !!!")
    }
    
    func insertDishes(dishes: [Dish]) -> Single<Bool> {
        return DataProviderManager.shared.insertDishes(dishes: dishes)
    }
    
    func insertDish(dish: Dish) -> Single<Bool> {
        return DataProviderManager.shared.insertDish(dish: dish)
    }
    
    func insertLocalDish(dish: Dish) -> Bool {
        fatalError("Operation is not available !!!")
    }
    
    func getDishes() -> Single<[Dish]> {
        DataProviderManager.shared.getAllDishes()
    }

    func deleteDish(dish: Dish) {
        DataProviderManager.shared.deleteDish(dish: dish)
    }
    
    func deleteLocalDish(dish: Dish) {
        fatalError("Operation is not available !!!")
    }
    
}

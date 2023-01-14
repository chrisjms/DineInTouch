//
//  LocalDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class LocalDishDataStore: DishDataStore {
    
    func insertLocalDish(dish: Dish) -> Bool {
        fatalError("Operation is not  !!!")
    }
    
    
    func saveDish() {
        fatalError("Operation is not  !!!")
    }
    
    func getDishes() -> Single<[Dish]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalDishes() -> [Dish] {
        fatalError("Operation is not  !!!")
    }
    
    func deleteDish() {
        fatalError("Operation is not available !!!")
    }
    
    func deleteLocalDish() {
        fatalError("Operation is not  !!!")
    }
    
    func insertDish(dish: Dish) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    
}

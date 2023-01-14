//
//  CloudDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CloudDishDataStore: DishDataStore {
    
    func insertDish(dish: Dish) -> Single<Bool> {
        fatalError("Operation is not  !!!")
    }
    
    func insertLocalDish(dish: Dish) -> Bool {
        fatalError("Operation is not available !!!")
    }
    
    
    func saveDish() {
        fatalError("Operation is not available !!!")
    }
    
    func getDishes() -> Single<[Dish]> {
        fatalError("Operation is not  !!!")
    }
    
    func getLocalDishes() -> [Dish] {
        fatalError("Operation is not available !!!")
    }
    
    func deleteDish() {
        fatalError("Operation is not  !!!")
    }
    
    func deleteLocalDish() {
        fatalError("Operation is not available !!!")
    }
    
}

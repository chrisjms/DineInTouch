//
//  LocalDishDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class LocalDishDataStore: DishDataStore {
    
    let dishDao: DishDao
    
    init() {
        self.dishDao = DishDao()
    }

    func insertDishes(dishes: [Dish]) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    func saveDish(dish: Dish) {
        dishDao.insert(dish: dish)
    }
    
    func saveAllDishes(dishes: [Dish]) {
        dishDao.insertAll(dishes: dishes)
    }
    
    func getDishes() -> Single<[Dish]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalDishes() -> Single<[Dish]> {
        return Single.just(dishDao.getAllDishes())
    }
    
    func deleteDish(dish: Dish) {
        fatalError("Operation is not available !!!")
    }
    
    func deleteLocalDish(dish: Dish) {
        dishDao.delete(dish: dish)
    }
    
    func insertDish(dish: Dish) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
}

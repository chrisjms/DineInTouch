//
//  DishDataRepository.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class DishDataRepository: DishRepository {
    
    private let dishDataStoreFactory: DishDataStoreFactory
    
    init() {
        self.dishDataStoreFactory = DishDataStoreFactory()
    }
    
    func sendDishes(dishes: [Dish]) -> Single<Bool> {
        let cloudDishDataStore = dishDataStoreFactory.createCloudDishDataStore()
        let localDishDataStore = dishDataStoreFactory.createLocalDishDataStore()
        return cloudDishDataStore.insertDishes(dishes: dishes)
            .do(onSuccess: { success in
                if success {
                    dishes.forEach { dish in
                        localDishDataStore.deleteLocalDish(dish: dish)
                    }
                } else {
                    localDishDataStore.saveAllDishes(dishes: dishes)
                }
            }, onError: { error in
                localDishDataStore.saveAllDishes(dishes: dishes)
            })
    }
    
    func getLocalDishes() -> Single<[Dish]> {
        return Single.just(dishDataStoreFactory.createLocalDishDataStore())
            .flatMap { localDishDataStore in
                localDishDataStore.getLocalDishes()
            }
    }
    
    func getCloudDishes() -> Single<[Dish]> {
        return Single.just(dishDataStoreFactory.createCloudDishDataStore())
            .flatMap { cloudDishDataStore in
                cloudDishDataStore.getDishes()
            }
    }
    
    func deleteLocalDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.dishDataStoreFactory.createLocalDishDataStore().deleteLocalDish(dish: dish)
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func deleteCloudDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.dishDataStoreFactory.createCloudDishDataStore().deleteDish(dish: dish)
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func saveLocalDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.dishDataStoreFactory.createLocalDishDataStore().insertDish(dish: dish)
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func saveCloudDish(dish: Dish) -> Single<Bool> {
        return Single.create { single in
            self.dishDataStoreFactory.createCloudDishDataStore().saveDish(dish: dish)
            single(.success(true))
            return Disposables.create()
        }
    }
    
}

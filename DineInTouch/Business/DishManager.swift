//
//  DishManager.swift
//  DineInTouch
//
//  Created by Chris on 22/01/2023.
//

import Foundation
import RxSwift

class DishManager: DishManagerProtocol {

    private let dishRepository: DishRepository
    
    init() {
        self.dishRepository = DishDataRepository()
    }

    func sendDishes(dishes: [Dish]) -> Single<Bool> {
        return Single.create { single in
            self.dishRepository.sendDishes(dishes: dishes)
                .do(onSuccess: { success in
                    if success {
                        single(.success(success))
                    }
                }, onError: { error in
                    single(.failure(error))
                })
            return Disposables.create()
        }
    }
    
    func getDishes(dishes: [Dish]) -> Single<[Dish]> {
        return Single.create { single in
            self.dishRepository.getCloudDishes()
                .do(onSuccess: { dishes in
                    single(.success(dishes))
                })
            return Disposables.create()
        }
    }
}

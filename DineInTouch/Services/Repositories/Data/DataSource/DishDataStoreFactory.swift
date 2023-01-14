//
//  DishDataStoreFactory.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation

class DishDataStoreFactory {
    
    private let cloudDishDataStore: CloudDishDataStore = CloudDishDataStore()
    private let localDishDataStore: LocalDishDataStore = LocalDishDataStore()
    
    func createCloudDishDataStore() -> CloudDishDataStore {
        return cloudDishDataStore
    }
    
    func createLocalDishDataStore() -> LocalDishDataStore {
        return localDishDataStore
    }
    
}

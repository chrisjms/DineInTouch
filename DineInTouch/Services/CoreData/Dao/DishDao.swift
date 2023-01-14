//
//  DishDao.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import CoreData

class DishDao {
    
    private let context = CoreDataManager.shared.persistentContainer.viewContext
    private let coreDataManager = CoreDataManager()

    func get(dishId: String) -> Dish? {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBDish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dishId = %@", dishId)
        if let dbDish = try? context.fetch(fetchRequest) {
            print("command fetched from local base")
            return dbDish.compactMap({
                DishDataMapper.dbDishToDish($0 as! DBDish)
            }).first!
        }
        return nil
    }
    
    func getAllDishes() -> [Dish] {
        let fetchRequest: NSFetchRequest<DBDish> = DBDish.fetchRequest()
        if let dbDish = try? context.fetch(fetchRequest) {
            print("all dishes from local base fetched")
            return dbDish.compactMap({
                DishDataMapper.dbDishToDish($0)
            })
        }
        return []
    }
    
    func insert(dish: Dish) {
        insertAll(dishes: [dish])
    }
    
    func insertAll(dishes: [Dish]) {
        dishes.forEach { dish in
            let dbDish = DishDataMapper.dishToDbDish(dish, inContext: context)
        }
        do {
            try context.save()
            print("Dishes saved in local base")
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBDish.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try coreDataManager.handleBatchDelete(request: deleteRequest, in: context)
            print("all dishes deleted in local base")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func delete(dish: Dish) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBDish.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dishId = %@", dish.dishId)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try coreDataManager.handleBatchDelete(request: deleteRequest, in: context)
            print("dish deleted in local base")
        } catch let error as NSError {
            print(error)
        }
    }

}

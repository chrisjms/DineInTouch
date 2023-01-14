//
//  CoreDataManager.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import CoreData

internal class CoreDataManager {
    
    public static let shared = CoreDataManager()
    let identifier: String = "com.chriisjms.DineInTouch"
    let model: String = "DineInTouchDataBase"

    lazy var persistentContainer: NSPersistentContainer = {
        
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
            
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            if let err = error{
                fatalError("Loading of store failed:\(err)")
            }
        }
        return container
    } ()
    
    func handleBatchDelete(request: NSBatchDeleteRequest, in context: NSManagedObjectContext) throws {
        request.resultType = .resultTypeObjectIDs
        let deleteResult = try context.execute(request) as? NSBatchDeleteResult
        if let objectIDs = deleteResult?.result as? [NSManagedObjectID] {
            NSManagedObjectContext.mergeChanges(
                fromRemoteContextSave: [NSDeletedObjectsKey: objectIDs],
                into: [context]
            )
        }
    }
    
}

//
//  CommandDao.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import CoreData

struct CommandDao {
    
    private let context = CoreDataManager.shared.persistentContainer.viewContext
    private let coreDataManager = CoreDataManager()
    
    func get(commandId: String) -> Command? {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBCommand.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "commandId = %@", commandId)
        if let dbCommand = try? context.fetch(fetchRequest) {
            print("command fetched from local base")
            return dbCommand.compactMap({
                CommandDataMapper.dbCommandToCommand($0 as! DBCommand)
            }).first!
        }
        return nil
    }
    
    func getAllCommands() -> [Command] {
        let fetchRequest: NSFetchRequest<DBCommand> = DBCommand.fetchRequest()
        if let dbCommand = try? context.fetch(fetchRequest) {
            print("all commands from local base fetched")
            return dbCommand.compactMap({
                CommandDataMapper.dbCommandToCommand($0)
            })
        }
        return []
    }
    
    func insert(command: Command) {
        insertAll(commands: [command])
    }
    
    func insertAll(commands: [Command]) {
        commands.forEach { command in
            let dbCommand = CommandDataMapper.commandToDbCommand(command, inContext: context)
        }
        do {
            try context.save()
            print("Commands saved in local base")
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBCommand.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try coreDataManager.handleBatchDelete(request: deleteRequest, in: context)
            print("all commands deleted in local base")
        } catch let error as NSError {
            print(error)
        }
    }
    
    func delete(command: Command) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DBCommand.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "commandId = %@", command.commandId)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try coreDataManager.handleBatchDelete(request: deleteRequest, in: context)
            print("command deleted in local base")
        } catch let error as NSError {
            print(error)
        }
    }
}

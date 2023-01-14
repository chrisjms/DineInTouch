//
//  CommandDataMapper.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import CoreData

class CommandDataMapper {
    
    static func dbCommandToCommand(_ commandDB: DBCommand) -> Command {
        return Command(commandId: commandDB.commandId!, tableId: commandDB.tableId, creationDate: commandDB.creationDate, dishes: Command.dishesStringToDishes(dishesString: commandDB.dishes!))
    }
    
    static func commandToDbCommand(_ command: Command, inContext context: NSManagedObjectContext) -> DBCommand {
        let commandDB = DBCommand(context: context)
        commandDB.dishes = Command.dishesArrayToString(dishes: command.dishes)
        commandDB.creationDate = command.creationDate
        commandDB.tableId = command.tableId
        commandDB.commandId = command.commandId
        return commandDB
    }
}

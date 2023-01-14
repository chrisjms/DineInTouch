//
//  LocalCommandDataStore.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class LocalCommandDataStore: CommandDataStore {
    
    let commandDao: CommandDao
    
    init() {
        self.commandDao = CommandDao()
    }
    
    func saveCommand(command: Command) {
        commandDao.insert(command: command)
    }
    
    func getCommands() -> Single<[Command]> {
        fatalError("Operation is not available !!!")
    }
    
    func getLocalCommands() -> Single<[Command]> {
        return Single.just(commandDao.getAllCommands())
    }
    
    func deleteAll() {
        fatalError("Operation is not available !!!")
    }
    
    func deleteAllLocalCommands() {
        commandDao.deleteAll()
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        fatalError("Operation is not available !!!")
    }
    
    
}

//
//  CommandDataRepository.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

class CommandDataRepository: CommandRepository {
    
    private let commandDataStoreFactory: CommandDataStoreFactory
    
    init() {
        self.commandDataStoreFactory = CommandDataStoreFactory()
    }
    
    func sendCommand(command: Command) -> Single<Bool> {
        let cloudCommandDataStore = commandDataStoreFactory.createCloudCommandDataStore()
        let localCommandDataStore = commandDataStoreFactory.createLocalCommandDataStore()
        return cloudCommandDataStore.sendCommand(command: command)
            .do(onSuccess: { success in
                if success {
                    localCommandDataStore.deleteAll()
                } else {
                    localCommandDataStore.saveCommand(command: command)
                }
            }, onError: { error in
                localCommandDataStore.saveCommand(command: command)
            })
    }
    
    func getLocalCommands() -> Single<[Command]> {
        return Single.just(commandDataStoreFactory.createLocalCommandDataStore())
            .flatMap { localCommandDataStore in
                localCommandDataStore.getLocalCommands()
            }
    }
    
    func getCloudCommands() -> Single<[Command]> {
        return Single.just(commandDataStoreFactory.createCloudCommandDataStore())
            .flatMap { cloudCommandDataStore in
                cloudCommandDataStore.getCommands()
            }
    }
    
    func deleteLocalCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.commandDataStoreFactory.createLocalCommandDataStore().deleteLocalCommand(command: command)
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func deleteCloudCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.commandDataStoreFactory.createCloudCommandDataStore().deleteCommand(command: command)
            single(.success(true))
            return Disposables.create()
        }
    }
    
    func saveLocalCommand(command: Command) -> Single<Bool> {
        return Single.create { single in
            self.commandDataStoreFactory.createLocalCommandDataStore().saveCommand(command: command)
            single(.success(true))
            return Disposables.create()
        }
    }
    
}

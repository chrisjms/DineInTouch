//
//  CommandRepository.swift
//  DineInTouch
//
//  Created by Chris on 14/01/2023.
//

import Foundation
import RxSwift

protocol CommandRepository {
    func sendCommand(command: Command) -> Single<Bool>
    func getLocalCommands() -> Single<[Command]>
    func getCloudCommands() -> Single<[Command]>
    func deleteLocalCommand(command: Command) -> Single<Bool>
    func deleteCloudCommand(command: Command) -> Single<Bool>
    func saveLocalCommand(command: Command) -> Single<Bool>
}

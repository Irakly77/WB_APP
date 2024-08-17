//
//  ChatInteractorProtocol.swift
//  WB_APP
//
//  Created by Irakli Chachava on 17.08.2024.
//

import Foundation
import Combine
import ExyteChat

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[UserMessage], Never> { get }
    var senders: [MockUser] { get }
    var otherSenders: [MockUser] { get }

    func send(draftMessage: DraftMessage)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}


//
//  File.swift
//  WB_APP
//
//  Created by Irakli Chachava on 17.08.2024.
//

import Foundation
import Combine
import ExyteChat

final class ChatInteractor: ChatInteractorProtocol {
    
//    let user: MockUser
    
    private lazy var chatData = ChatData()
    
    private lazy var chatState = CurrentValueSubject<[UserMessage], Never>(generateStartMessages())
    
    private lazy var sharedState = chatState.share()
    
    private let isActive: Bool
    private var isLoading = false
    private var lastDate = Date()
    
    private var subscriptions = Set<AnyCancellable>()
    
    var messages: AnyPublisher<[UserMessage], Never> {
        sharedState.eraseToAnyPublisher()
    }
    
    var senders: [MockUser] {
        var members = [chatData.maman, chatData.petya]
        if isActive { members.append(chatData.lisa) }
        return members
    }
    
    var otherSenders: [MockUser] {
        senders.filter { !$0.isCurrentUser }
    }
    
    init(isActive: Bool = false) {
        self.isActive = isActive
    }
    
    func send(draftMessage: ExyteChat.DraftMessage) {
        if draftMessage.id != nil {
            guard let index = chatState.value.firstIndex(where: { $0.uid == draftMessage.id }) else {
                // TODO: Create error
                return
            }
            chatState.value.remove(at: index)
        }

        Task {
            var status: Message.Status = .sending
            if Int.random(in: 0...20) == 0 {
                status = .error(draftMessage)
            }
            let message = await draftMessage.toMockMessage(user: chatData.petya, status: status)
            DispatchQueue.main.async { [weak self] in
                self?.chatState.value.append(message)
            }
        }
    }
    
    func connect() {
        Timer.publish(every: 2, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSendingStatuses()
                if self?.isActive ?? false {
                    self?.generateNewMessage()
                }
            }
            .store(in: &subscriptions)
    }

    func disconnect() {
        subscriptions.removeAll()
    }

    func loadNextPage() -> Future<Bool, Never> {
        Future<Bool, Never> { [weak self] promise in
            guard let self = self, !self.isLoading else {
                promise(.success(false))
                return
            }
            self.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                guard let self = self else { return }
                let messages = self.generateStartMessages()
                self.chatState.value = messages + self.chatState.value
                self.isLoading = false
                promise(.success(true))
            }
        }
    }
}

private extension ChatInteractor {
    func generateStartMessages() -> [UserMessage] {
        defer {
            lastDate = lastDate.addingTimeInterval(-(60*60*24))
        }
        return (0...10)
            .map { index in
                chatData.randomMessage(senders: senders, date: lastDate.randomTime())
            }
            .sorted { lhs, rhs in
                lhs.createdAt < rhs.createdAt
            }
    }

    func generateNewMessage() {
        let message = chatData.randomMessage(senders: otherSenders)
        chatState.value.append(message)
    }

    func updateSendingStatuses() {
        let updated = chatState.value.map {
            var message = $0
            if message.status == .sending {
                message.status = .sent
            } else if message.status == .sent {
                message.status = .read
            }
            return message
        }
        chatState.value = updated
    }
}


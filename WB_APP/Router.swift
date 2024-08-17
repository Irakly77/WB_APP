//
//  Router.swift
//  WB_APP
//
//  Created by Irakli Chachava on 17.08.2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var homeScreen: MyPage = .contactsList
    
    func push(_ page: MyPage) {
        path.append(page)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goToFirst() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
        case .contactsList:
            EmptyView()
        case .contactsDetails(let contact):
            EmptyView()
        case .chat(let contact):
            ContactChatScreen(contact: contact)
        case .addNewContact:
            EmptyView()
        }
    }
}

enum MyPage: Hashable {
    case contactsList, contactsDetails(MockUser), chat(MockUser), addNewContact
}

//
//  TimeAndStatusView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 17.08.2024.
//

import SwiftUI
import ExyteChat

struct TimeAndStatusView: View {
    var message: Message
    var isOP: Bool
    var statusStruct: Status
    var body: some View {
        if isOP {
            HStack(spacing: CGFloat.two) {
                Text(message.createdAt, style: .time)
                    .environment(\.locale, .init(identifier: "ru_RU"))
                Text("·")
                Text(statusStruct.getStatus(status: message.status))
                
            }
            .padding(.leading, 150)
            .padding(.bottom, CGFloat.ten)
            .font(.system(size: CGFloat.ten))
            .foregroundColor(.white)
        }
    }
}


//
//  File.swift
//  WB_APP
//
//  Created by Irakli Chachava on 16.07.2024.
//

import SwiftUI
import UserNotifications

struct VerificationView: View {
    @State private var showBanner = false
    @State private var confirmationCode = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Введите код")
                    .offset(y: 169)
                    .font(.custom("SF Pro Display", size: 24))
                    .padding(.bottom,8)
                Text("Отправили код на номер \n+7 999 999-99-99")
                    .multilineTextAlignment(.center)
                    .lineSpacing(24)
                    .font(.custom("SF Pro Display", size: 14))
                    .offset(y: 177)
            }
            Spacer()
            
            CodeInputView()
                .offset(y: 90)
            Spacer()
            Button(action: {
                sendPushNotification()
            }) {
                Text("Запросить код повторно")
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color.color1)
                    .padding(.bottom, 330)
            }
        }
        .onAppear {
            requestNotificationPermission()
        }
        .banner(data: $confirmationCode, show: $showBanner)
    }
    
    func sendPushNotification() {
        confirmationCode = String(format: "%04d", Int.random(in: 0...9999))
        let content = UNMutableNotificationContent()
        content.title = "Код подтверждения"
        //  content.body = "Ваш код подтверждения: \(confirmationCode)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Ошибка при добавлении уведомления: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    showBanner = true
                }
            }
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Разрешение на уведомления получено")
            } else if let error = error {
                print("Ошибка при запросе разрешения: \(error.localizedDescription)")
            }
        }
    }
}

struct BannerModifier: ViewModifier {
    @Binding var data: String
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    Text("Код подтверждения: \(data)")
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .transition(.move(edge: .top))
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            show = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func banner(data: Binding<String>, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(data: data, show: show))
    }
}

#Preview {
    VerificationView()
}


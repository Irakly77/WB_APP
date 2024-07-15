//
//  Animation.swift
//  WB_APP
//
//  Created by Irakli Chachava on 14.07.2024.


import SwiftUI

struct Animations: View {
    @State private var phoneNumber: String = ""
    @State private var isLoading: Bool = false
    @State private var showText: Bool = true
    
    var body: some View {
        VStack {
            if showText {
                VStack {
                    Text("Введите номер телефона")
                        .font(.custom("SF Pro Display", size: 24))
                        .padding(.bottom, 8)
                        .fontWeight(.bold)
                    Text("Мы вышлем код подтверждения \nна указанный номер")
                        .multilineTextAlignment(.center)
                }
                .frame(width: 293, height: 85)
                .offset(y: -79)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .frame(width: 293, height: 85)
                    .offset(y: -79)
            }
            HStack {
                Text("🇷🇺 +7")
                    .frame(width: 57, height: 36)
                    .background(Color("Color1"))
                    .cornerRadius(8.0)
                
                TextField("000 000-00-00", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .frame(width: 262, height: 36)
                    .background(Color.color1)
                    .cornerRadius(8.0)
                
            }
            .offset(y: -49)
            
            Button(action: {
                withAnimation {
                    showText = false
                    isLoading = true
                }
            }) {
                Text("Продолжить")
                    .frame(width: 327, height: 52)
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(.color1)
                    .background(Color.color2.opacity(0.5))
                    .cornerRadius(30.0)
                
            }
        }
    }
}

#Preview {
    Animations()
}

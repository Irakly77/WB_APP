//
//  SwiftUIView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 16.07.2024.
//

import SwiftUI

struct CodeInputView: View {
    @State private var code: [String] = Array(repeating: "", count: 4)
    @FocusState private var focusedField: Int?
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(0..<4) { index in
                ZStack {
                    if code[index].isEmpty {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 24, height: 24)
                    }
                    TextField("", text: $code[index])
                        .frame(width: 24, height: 24)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .font(.system(size: 32)) //
                        .focused($focusedField, equals: index)
                        .onChange(of: code[index]) { newValue in
                            if newValue.count > 1 {
                                code[index] = String(newValue.prefix(1))
                            }
                            if newValue.count == 1 {
                                focusedField = index + 1
                            }
                        }
                }
            }
        }
        .onAppear {
            focusedField = 0
        }
    }
}

#Preview {
    CodeInputView()
}



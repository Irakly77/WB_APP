//
//  MyCustomTextField.swift
//
//
//  Created by Irakli Chachava on 25.07.2024.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct MyCustomTextField: View {
    @Binding var text: String
    var placeholder: String

    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
}

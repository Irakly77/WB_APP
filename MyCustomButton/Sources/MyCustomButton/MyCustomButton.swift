// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct MyCustomButton: View {
    var title: String
    var action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    @available(iOS 13.0, *)
    @available(macOS 10.15, *)
    public var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

//
//  ImageLoader.swift
//  WB_APP
//
//  Created by Irakli Chachava on 04.08.2024.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil

    var cancellable: AnyCancellable?

    func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .map(UIImage.init)
            .replaceNil(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error loading image: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] in
                self?.image = $0
            })
    }

    deinit {
        cancellable?.cancel()
    }
}

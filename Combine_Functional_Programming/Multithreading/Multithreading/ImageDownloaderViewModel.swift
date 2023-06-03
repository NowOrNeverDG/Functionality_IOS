//
//  ImageDownloaderViewModel.swift
//  Multithreading
//
//  Created by Ge Ding on 3/29/23.
//

import UIKit
import Combine

final class ImageDownloaderViewModel {
    let image = PassthroughSubject<UIImage?,Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    
    func download(url: String) {
        URLSession
            .shared
            .dataTaskPublisher(for: URL(string: url)!)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .handleEvents(receiveRequest:  { _ in
                print("Starting subscription on the main thread \(Thread.isMainThread)")
                DispatchQueue
                    .main
                    .async {
                        self.image.send(UIImage(named: "placeholder"))
                        print("Setting placeHolder on the main thread: \(Thread.isMainThread)")
                    }
            })
            .map({UIImage(data: $0.data)})
            .receive(on: DispatchQueue.main)
            .sink { (res) in
                print("Finished subscription on the main thread: \(Thread.isMainThread)")
            } receiveValue: { [weak self] (val) in
                self?.image.send(val)
                self?.image.send(completion: .finished)
                print("Received subscription on the main thread: \(Thread.isMainThread)")
            }
            .store(in: &subscriptions)

    }
}

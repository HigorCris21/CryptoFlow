//
//  CoinImageService.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 10/07/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    
    init() {
//        getCoinImage()
    }
    
    private func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
        
    }
    
}

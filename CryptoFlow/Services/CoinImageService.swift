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
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        self.getCoinImage()
        
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            dowloadCoinImage()
            print("Dowloading image now")
            
        }
            
    }
    
    
    private func dowloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in return UIImage(data: data)
            })
    
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let dowloadedImage = returnedImage else { return }
                self.image = dowloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: dowloadedImage, imageName: self.imageName, folderName: self.folderName)
                
            })
    }
}

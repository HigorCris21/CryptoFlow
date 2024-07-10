//
//  CoinImageView.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 10/07/24.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    init() {
        getImage()
    }
    
    private func getImage() {
        
    }
}

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel = CoinImageViewModel()
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView()
}

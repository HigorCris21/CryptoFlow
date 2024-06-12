//
//  HomeViewModel.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 12/06/24.
//

import Foundation

// Define um ViewModel para a tela inicial do app
class HomeViewModel: ObservableObject {
    
    // Lista de todas as moedas, observável para refletir mudanças na interface
    @Published var allCoins: [CoinModel] = []
    
    // Lista de moedas que estão no portfólio, também observável
    @Published var portifolioCoins: [CoinModel] = []
    
    // Construtor da classe
    init() {
        // Adiciona uma moeda de exemplo à lista após 2 segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portifolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}

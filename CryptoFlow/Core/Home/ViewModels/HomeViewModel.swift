//
//  HomeViewModel.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 12/06/24.
//

import Foundation
import Combine

// Define um ViewModel para a tela inicial do app
class HomeViewModel: ObservableObject {
    
    // Lista de todas as moedas, observável para refletir mudanças na interface
    @Published var allCoins: [CoinModel] = []
    
    // Lista de moedas que estão no portfólio, também observável
    @Published var portifolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    
    // Construtor da classe
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
    }
}

//
//  CoinDataService.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 17/06/24.
//

import Foundation
import Combine

class CoinDataService {
   
    @Published var allCoins: [CoinModel] = []
    
    // Propriedade para armazenar a assinatura do publisher que busca as moedas.
    var coinSubscription: AnyCancellable?
    
    // Inicializador da classe que chama a função para obter moedas ao criar uma instância.
    init() {
        getCoins()
    }
    
    // Função privada que faz a requisição para obter dados de moedas.
    private func getCoins() {
        guard let url = URL(string:     "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkLine=truesprice_change_percentage=24h)") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
    }
}

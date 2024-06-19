//
//  CoinDataService.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 17/06/24.
//

import Foundation
import Combine

// Define uma classe para gerenciar a obtenção de dados de moedas.
class CoinDataService {
    
    // Propriedade publicada que armazenará a lista de moedas.
    @Published var allCoins: [CoinModel] = []
    
    // Propriedade para armazenar a assinatura do publisher que busca as moedas.
    var coinSubscription: AnyCancellable?
    
    // Inicializador da classe que chama a função para obter moedas ao criar uma instância.
    init() {
        getCoins()
    }
    
    // Função privada que faz a requisição para obter dados de moedas.
    private func getCoins() {
        
        // Tenta criar um URL a partir de uma string.
        // Se falhar, a função retorna sem fazer nada.
        guard let url = URL(string:     "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkLine=truesprice_change_percentage=24h)") else { return }
        
        // Cria um publisher que faz a requisição de rede.
        coinSubscription = NetworkingManager.download(url: url)
        
            // Decodifica os dados recebidos em um array de `CoinModel`.
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            // `sink` lida com a conclusão da requisição e os valores recebidos.
            .sink { (completion) in
                // Verifica o status da operação.
                switch completion {
                case .finished:
                    // Se a operação terminou com sucesso, não faz nada.
                    break
                case .failure(let error):
                    // Se houve um erro, imprime a mensagem de erro.
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                // Recebe o array de moedas e atualiza a propriedade `allCoins`.
                self?.allCoins = returnedCoins
                // Cancela a assinatura após obter os dados.
                self?.coinSubscription?.cancel()
            }
        
    }
}

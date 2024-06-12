//
//  PreviewProvider.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 11/06/24.DeveloperPreview
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?15470335",
        currentPrice: 58908,
        marketCap: 1100013258170,
        marketCapRank: 1,
        fullyDilutedValuation: 1235028318246,
        totalVolume: 69075964521,
        high24H: 59504,
        low24H: 57672,
        priceChange24H: 808.94,
        priceChangePercentage24H: 1.39234,
        marketCapChange24H: 13240944103,
        marketCapChangePercentage24H: 1.21837,
        circulatingSupply: 18704250,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 61712,
        athChangePercentage: -0.97589,
        athDate: "2021-03-13T20:49:26.606Z",
        atl: 67.81,
        atlChangePercentage: 90020.24075,
        atlDate: "2013-07-0600:00:00.000z",
        lastUpdated: "2021-03-13T23:18:10.268Z",
        sparklineIn7D: SparklineIn7D(price: [
            54019.26878317463,
            53718.060435791524,
            53677.12968669343,
            53848.3814432924,
            53561.593235320615,
            53456.0913723206,
            53888.97184353125,
            54796.37233913172,
            54593.507358383504,
            54582.558599307624,
            54635.7248282177,
            54772.612788430226,
            55192.54513921453,
            54878.11598538206,
            54513.95881205807,
            55013.68511841942
        ]),
        priceChangePercentage24HInCurrency: 3952.64,
        currentHoldings: 1.5)
        
        }

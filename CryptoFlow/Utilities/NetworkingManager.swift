//
//  NetworkingManager.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 19/06/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    static func download (url: URL) -> AnyPublisher <Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        
    }
    
}
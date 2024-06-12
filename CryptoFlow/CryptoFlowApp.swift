//
//  CryptoFlowApp.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 05/06/24.
//

import SwiftUI

@main
struct CryptoFlowApp: App {
    
    // Cria um único ViewModel para a aplicação
    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                // Configura a visualização inicial da aplicação
                HomeView()
                    .navigationBarHidden(true)
            }
            // Passa o ViewModel para o ambiente
            .environmentObject(vm)
        }
    }
}

//
//  HomeView.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 05/06/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            //Camada de fundo
            Color.theme.background
                .ignoresSafeArea()
            
            //Conteúdo
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    HomeView()
}

//  HomeView.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 05/06/24.
//

import SwiftUI

// Define a visualização principal da tela inicial
struct HomeView: View {
    
    // Vincula o view model ao ambiente da visualização
    @EnvironmentObject private var vm: HomeViewModel
    
    // Estado que controla a exibição da seção de portfólio
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Define o fundo da visualização como a cor do tema e ignora as margens seguras
            Color.theme.background
                .ignoresSafeArea()
            
            // Contém o conteúdo principal da tela
            VStack {
                
                // Cabeçalho da tela
                homeHeader
                
                if !showPortfolio {
                    // Lista que exibe as informações das moedas
                    List {
                        ForEach(vm.allCoins) { coin in
                            CoinRowView(coin: coin,
                                        showHoldingsColumn: false)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .leading))
                }
                Spacer(minLength: 0)
            }
        }
    }
}

// Extensão para agrupar partes da UI
extension HomeView {
    
    // Cabeçalho da tela inicial
    private var homeHeader: some View {
        HStack {
            // Botão circular com ícone que alterna entre "plus" e "info"
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    // Animação para o botão
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            
            Spacer()
            
            // Texto que muda conforme o estado de showPortfolio
            Text(showPortfolio ? "Portifólio" : "Cotações ao Vivo")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            // Botão que gira conforme o estado de showPortfolio
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    // Animação para alternar entre mostrar ou ocultar o portfólio
                    withAnimation (.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

// Pré-visualização para o canvas

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
           }
        .environmentObject(dev.homeVM)

    }
}


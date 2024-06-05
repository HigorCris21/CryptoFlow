//
//  Color.swift
//  CryptoFlow
//
//  Created by Higor  Lo Castro on 05/06/24.
//

import Foundation
import SwiftUI

// Extensão da classe Color para adicionar um tema de cores personalizado
extension Color {
    
    // Propriedade estática para acessar o tema de cores
    static let theme = ColorTheme()
    
}

// Estrutura que define o tema de cores
struct ColorTheme {
    
    // Definição de várias cores usadas no aplicativo
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

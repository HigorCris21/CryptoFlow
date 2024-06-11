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
}

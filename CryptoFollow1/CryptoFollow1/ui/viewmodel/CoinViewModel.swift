//
//  CoinViewModel.swift
//  CryptoFollow1
//
//  Created by Halil Keremoğlu on 2.06.2025.
//

import Foundation

class CoinViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    private let service = CoinService()

    func loadData() {
        service.fetchCoins { [weak self] result in // hafıza sızıntısını önlemek için
            DispatchQueue.main.async {
                self?.coins = result ?? []
            }
        }
    }
    
    
    
}

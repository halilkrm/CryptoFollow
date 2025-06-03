//
//  ContentView.swift
//  CryptoFollow1
//
//  Created by Halil Keremoğlu on 2.06.2025.
//

import SwiftUI

struct MainPage: View {
    @StateObject var viewModel: CoinViewModel

    init(viewModel: CoinViewModel = CoinViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.coins) { coin in
                HStack {
                    Group {
                        if let imageUrlString = coin.image,
                           let imageUrl = URL(string: imageUrlString) {
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "photo")
                        }
                    }
                    .frame(width: 32, height: 32)

                    VStack(alignment: .leading) {
                        Text(coin.name ?? "N/A").font(.headline)
                        Text(coin.symbol?.uppercased() ?? "").font(.subheadline)
                    }

                    Spacer()
                    Text("$\(coin.current_price ?? 0.0, specifier: "%.2f")")
                        .foregroundColor(.green)
                }
            }
            .navigationTitle("Crypto Follow")
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    PreviewMainPage()
}

struct PreviewMainPage: View { // ön izleme için preview
    @StateObject private var dummyViewModel = CoinViewModel()

    init() {
        let dummyCoins = [
            Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: nil, current_price: 60000, price_change_percentage_24h: 1.5),
            Coin(id: "ethereum", symbol: "eth", name: "Ethereum", image: nil, current_price: 3000, price_change_percentage_24h: -0.3)
        ]
        _dummyViewModel = StateObject(wrappedValue: CoinViewModel())
        dummyViewModel.coins = dummyCoins  // Burada atama yapılıyor
    }

    var body: some View {
        MainPage(viewModel: dummyViewModel)
    }
}

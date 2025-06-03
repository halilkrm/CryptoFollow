//
//  Coin.swift
//  CryptoFollow1
//
//  Created by Halil Keremoğlu on 2.06.2025.
//

import Foundation

struct Coin: Decodable, Identifiable{
    let id:String?
    let symbol:String?
    let name:String?
    let image:String?
    let current_price:Double?
    let price_change_percentage_24h:Double?

}

//
//  CoinServise.swift
//  CryptoFollow1
//
//  Created by Halil Keremoğlu on 2.06.2025.
//

import Foundation
import Alamofire//urlsession ile yazılacak kodları tek satıra indirir, http isteklerini basitleştirir

class CoinService{
    func fetchCoins(completion: @escaping ([Coin]?) -> Void){ // completion dış dünyaya sonucu döndüren bir kapanıştır(closure). Escaping closurenin fonksiyon dışında bir yerde calısacagını belitir(asekron)
        let url = "https://api.coingecko.com/api/v3/coins/markets"
        
        let parameters: Parameters = [
                    "vs_currency": "usd",
                    "order": "market_cap_desc",
                    "per_page": 50,
                    "page": 1,
                    "sparkline": false
                ]
         
        AF.request(url,parameters: parameters).responseDecodable(of: [Coin].self) { response in
            switch response.result {
            case .success(let coins):
                completion(coins)
            case .failure(let error):
                print("Error: \(error)")
                completion(nil)
            }
             
        }
        
    }
}

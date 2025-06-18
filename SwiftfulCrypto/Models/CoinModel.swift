//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 13/04/25.
//
/*
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    "current_price": 85407,
    "market_cap": 1694533216118,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 1694533216118,
    "total_volume": 22599797454,
    "high_24h": 85630,
    "low_24h": 82862,
    "price_change_24h": 1765.76,
    "price_change_percentage_24h": 2.11111,
    "market_cap_change_24h": 32943621214,
    "market_cap_change_percentage_24h": 1.98266,
    "circulating_supply": 19850381,
    "total_supply": 19850381,
    "max_supply": 21000000,
    "ath": 108786,
    "ath_change_percentage": -21.51663,
    "ath_date": "2025-01-20T09:11:54.494Z",
    "atl": 67.81,
    "atl_change_percentage": 125810.34616,
    "atl_date": "2013-07-06T00:00:00.000Z",
    "roi": null,
    "last_updated": "2025-04-12T22:03:26.889Z",
 "price_change_percentage_24h_in_currency": 2.11111211303008
 */

import Foundation

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
       let image: String
       let currentPrice: Double
       let marketCap, marketCapRank, fullyDilutedValuation: Double?
       let totalVolume: Double?
       let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
       let marketCapChange24H, marketCapChangePercentage24H: Double?
       let circulatingSupply, totalSupply: Double?
       let maxSupply: Double?
       let ath, athChangePercentage: Double?
       let athDate: String?
       let atl, atlChangePercentage: Double?
       let atlDate: String?
       let lastUpdated: String?
       let sparklineIn7D: SparklineIn7D?
       let priceChangePercentage24HInCurrency: Double?
       let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey{
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap="market_cap"
        case marketCapRank="market_cap_rank"
        case fullyDilutedValuation="fully_diluted_valuation"
        case totalVolume="total_volume"
        case high24H="high_24h"
        case low24H="low_24h"
        case priceChange24H="price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H="market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply="circulating_supply"
        case totalSupply="total_supply"
        case maxSupply="max_supply"
        case ath
        case athChangePercentage="ath_change_percentage"
        case atlDate="atl_date"
        case atl
        case athDate="ath_date"
        case atlChangePercentage="atl_change_percentage"
        case lastUpdated="last_updated"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case sparklineIn7D="sparkline_in_7d"
        case currentHoldings
    }
    func updateHoldings(amount: Double) -> CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    var currentHoldingsValue: Double{
        return (currentHoldings ?? 0)*currentPrice
    }
    
    var rank: Int{
        return Int(marketCapRank ?? 0)
    }

}
struct SparklineIn7D: Codable{
    let price: [Double]?
    
}

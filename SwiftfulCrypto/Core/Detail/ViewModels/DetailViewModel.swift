//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 28/05/25.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil

    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailService.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
                self?.redditURL = returnedCoinDetails?.links?.subredditURL
            
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistics(CoinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]){
      
        let overviewArray = createOverviewArray(coinModel: coinModel)
        let additionalArray = createAdditionalArray(coinModel: coinModel, CoinDetailModel: CoinDetailModel)
       
        
        return (overviewArray, additionalArray)
    }
  private  func createOverviewArray(coinModel: CoinModel)->[StatisticModel]{
        let price = coinModel.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StatisticModel(title: "rank", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StatisticModel(title: "Volume", value: volume)
        
        let overviewArray: [StatisticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        return overviewArray
        
    }
     
    private func createAdditionalArray(coinModel: CoinModel, CoinDetailModel: CoinDetailModel?)->[StatisticModel]{
        
        let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "NA"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "NA"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "NA"
        let pricePercentChange2 = coinModel.priceChangePercentage24H
        
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange2)
        
        let marketCapChange = coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "NA"
        let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange2)
        
        let blockTime = CoinDetailModel?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "NA" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        
        let hashing = CoinDetailModel?.hashingAlgorithm ?? "NA"
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        let additionalArray: [StatisticModel] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray
    }
    
}

//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 27/05/25.
//

import SwiftUI

struct DetailLoadingView{
    let coin: CoinModel
    
    var body: some View{
        DetailView(coin: coin)
        }
    }

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())

    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        
    }
    var body: some View {
        ScrollView{
            VStack{
                ChartView(coin: vm.coin)
                    .padding(.vertical)
               
                VStack(spacing: 20){
                    overviewTitle
                    Divider()
                    
                    descriptionSection
                  
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                    
                    websiteSection
                    
                }
                .padding()
                
            }
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView{
    
    private var navigationBarTrailingItems: some View{
        HStack{
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25,height: 25)
        
        }
    }
    
    private var overviewTitle: some View{
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var additionalTitle: some View{
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View{
        ZStack{
            if let coinDescription = vm.coinDescription,
               !coinDescription.isEmpty{
                VStack(alignment: .leading){
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    Button {
                        withAnimation(.easeInOut){
                            showFullDescription.toggle()
                        }
                    } label: {
                        Text(showFullDescription ? "Read less" : "Read More..")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical)
                    }
                    .accentColor(.blue)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    private var overviewGrid: some View{
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
            ForEach(vm.overviewStatistics){ stat in
                StatisticView(stat: stat)
                
            }
        }
    }
    
    private var additionalGrid: some View{
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
            ForEach(vm.additionalStatistics){ stat in
                StatisticView(stat: stat)
                
            }
        }
    }
    
    private var websiteSection: some View{
        VStack(alignment: .leading, spacing: 20){
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
                
            }
            
            if let redditURL = vm.redditURL,
               let url = URL(string: redditURL){
                Link("Reddit", destination: url)
            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
    
    
}

//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by Achla Ajay on 12/06/25.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/achla2807")!
    let cryptoURL = URL(string: "https://github.com/achla2807/SwiftfulCrypto")!
    var body: some View {
        NavigationView{
            ZStack{
                Color.theme.background
                    .ignoresSafeArea()
                
                List{
                    CryptoTrackerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    CoinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))

                    DeveloperSection
                        .listRowBackground(Color.theme.background.opacity(0.5))

                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))

                    
                }
            }
            .accentColor(.blue)
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView{
    private var CryptoTrackerSection: some View{
        
        Section(header: Text("Crypto Tracker")){
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Text("Crypto Tracker is a sleek and modern cryptocurrency tracking app built with SwiftUI. It lets users view live prices, manage their crypto portfolio, and explore detailed coin data in real time—all with smooth navigation, intuitive sorting, and a clean, user-friendly interface. It uses MVVM architecture")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
            }
            .padding(.vertical)
            Link("Code",destination: cryptoURL)

        }
        .listStyle(GroupedListStyle())
        
    }
    private var CoinGeckoSection: some View{
        
        Section(header: Text("CoinGecko")){
            VStack(alignment: .leading){
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Text("The CoinGecko API has been a simple and reliable way to access real-time cryptocurrency data. It provides all the essential information I needed—like prices, market caps, and coin details—without requiring an API key, which made integration into my SwiftUI app smooth and beginner-friendly. Prices may be slightly delayed though")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
            }
            .padding(.vertical)
            Link("CoinGecko",destination: coingeckoURL)

        }
        .listStyle(GroupedListStyle())
        
    }
    private var DeveloperSection: some View{
        
        Section(header: Text("Developer")){
            VStack(alignment: .leading){
                Image("achla")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                Text("I'm a passionate and driven B.Tech 4th-year student specializing in iOS development. With hands-on experience building SwiftUI apps like Crypto Tracker, I enjoy creating clean, user-friendly interfaces and exploring modern Apple frameworks. I'm constantly learning and striving to grow as a native iOS developer.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                
            }
            .padding(.vertical)
            Link("Github",destination: personalURL)

        }
        .listStyle(GroupedListStyle())
        
    }
    
    private var applicationSection: some View{
        Section(header: Text("Application")){
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Learn More", destination: defaultURL)

        }
    }


}

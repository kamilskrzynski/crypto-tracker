//
//  CoinView.swift
//  CryptoTracker
//
//  Created by Kamil Skrzyński on 25/05/2022.
//

import SwiftUI

struct CoinView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: coin.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                    Text(coin.symbol.uppercased())
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    
                    Text(coin.formattedPrice)
                        .font(.system(size: 15, weight: .semibold))
                    Text(coin.formattedPriceChangePercentage24H)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(coin.formattedPriceChangePercentage24H.hasPrefix("-") ? .red : .green)
                }
            }
        }
        .frame(height: 60)
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.gray.opacity(0.1)))
    }
}

//struct CoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let coin = Coin(id: "", name: "Bitcoin", symbol: "BTC", image: "", currentPrice: 0.0)
//        
//        CoinView(coin: coin)
//    }
//}

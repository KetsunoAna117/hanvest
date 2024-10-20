//
//  StockHeaderInformationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct StockHeaderInformationView: View {
    var stockCodeName: String
    var stockName: String
    
    @Binding var initialPrice: Int
    @Binding var currentPrice: Int
    
    var body: some View {
        VStack {
            HanvestCardBackground {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(stockCodeName)
                            .font(.nunito(.largeTitle, .bold))
                        Text(stockName)
                            .font(.nunito(.caption1))
                            .padding(.top, -5)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(HanvestPriceFormatter.formatIntToIDR(currentPrice))
                            .font(.nunito(.title2, .bold))
                        HanvestProfitLossLabelView(
                            initialValue: $initialPrice,
                            currentValue: $currentPrice
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable
    @State var currentPrice: Int = 5300
    
    @Previewable
    @State var initialPrice: Int = 5000
    
    StockHeaderInformationView(
        stockCodeName: "BBRI",
        stockName: "PT. Bank Rakyat Indonesia Tbk.",
        initialPrice: $initialPrice,
        currentPrice: $currentPrice
    )
}

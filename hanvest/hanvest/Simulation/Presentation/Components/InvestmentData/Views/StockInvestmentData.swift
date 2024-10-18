//
//  StockInvestmentData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import SwiftUI

struct StockInvestmentData: View {
    @Binding var stockNameID: String
    @Binding var userStockInvestment: Int
    @Binding var userTotalEquity: Int
    
    @StateObject private var viewmodel: StockInvestmentDataViewModels = .init()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your Investment in \(stockNameID)")
                            .font(.nunito(.subhead))
                        Text(HanvestPriceFormatter.formatIntToIDR(userStockInvestment))
                            .font(.nunito(.subhead, .bold))
                    }
                    
                    Rectangle()
                        .foregroundStyle(.tertiary)
                        .frame(maxWidth: 1, maxHeight: 36)
                        .padding(.horizontal, 10)
                    
                    VStack(alignment: .trailing) {
                        Text("Total Equity in \(stockNameID)")
                            .font(.nunito(.subhead))
                        Text(HanvestPriceFormatter.formatIntToIDR(userTotalEquity))
                            .font(.nunito(.subhead, .bold))
                    }
                    

                }
                .padding(.horizontal, 10)
                .padding(.vertical, 12)
                
                VStack {
                    HStack {
                        Text("P/L: Rp ")
                            .font(.nunito(.subhead, .bold))
                        HanvestProfitLossLabelView(
                            initialValue: $userStockInvestment,
                            currentValue: $userTotalEquity
                        )
                    }
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                }
                .background(
                    Rectangle()
                        .stroke(.mineShaft200, lineWidth: 1)
                        .background(
                            Rectangle()
                                .fill(.seagull100)
                        )
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 12, bottomTrailingRadius: 12
                            )
                        )
                )
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.mineShaft200, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.mineShaft50)
                )
        )
    }
}

#Preview {
    @Previewable @State var stockNameID: String = "BBRI"
    @Previewable @State var userInvestment: Int = 1000
    @Previewable @State var userTotalEquity: Int = 3000
    
    StockInvestmentData(
        stockNameID: $stockNameID,
        userStockInvestment: $userInvestment,
        userTotalEquity: $userTotalEquity
    )
    .padding(20)
}

//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    @Binding var selectedStock: SimulationStockEntity?
    
    @StateObject var viewmodel = SimulationStockDetailViewModel()
    
    var body: some View {
        VStack {
            if let selectedStock = selectedStock {
                StockHeaderInformationView(
                    stockCodeName: selectedStock.stockIDName,
                    stockName: selectedStock.stockName,
                    initialPrice: $viewmodel.initialPrice,
                    currentPrice: $viewmodel.currentPrice
                )
                
                HanvestStockPriceChart(
                    viewmodel: HanvestStockPriceChartViewModel(
                        stockPrices: selectedStock.stockPrice),
                    symbolCategoryKeyPath: \.stockIDName,
                    displayBy: .hour
                )
            }
            else {
                Text("No Stock selected")
                    .font(.nunito(.title2, .bold))
            }

        }
        .padding(.horizontal, 20)
        .onChange(of: selectedStock) { oldValue, newValue in
            viewmodel.initialPrice = newValue?.stockPrice.first?.stockPrice ?? 0
            viewmodel.currentPrice = newValue?.stockPrice.last?.stockPrice ?? 0
        }


    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStock: .constant(SimulationStockEntity.getMockData().first!)
    )
}

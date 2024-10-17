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
        ScrollView {
            VStack(spacing: 24) {
                if let selectedStock = selectedStock {
                    StockHeaderInformationView(
                        stockCodeName: selectedStock.stockIDName,
                        stockName: selectedStock.stockName,
                        initialPrice: $viewmodel.initialPrice,
                        currentPrice: $viewmodel.currentPrice
                    )
                    
                    HanvestStockPriceChart(
                        viewmodel: HanvestProductPriceChartViewModel(
                            prices: selectedStock.stockPrice),
                        symbolCategoryKeyPath: \.name,
                        displayBy: .hour
                    )
                    
                    StockCompanyProfileInformation(desc: selectedStock.stockDescription)
                }
                else {
                    Text("No Stock selected")
                        .font(.nunito(.title2, .bold))
                }
                
            }
            .padding(.horizontal, 20)
            .onChange(of: selectedStock) { oldValue, newValue in
                viewmodel.initialPrice = newValue?.stockPrice.first?.price ?? 0
                viewmodel.currentPrice = newValue?.stockPrice.last?.price ?? 0
            }
        }


    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStock: .constant(SimulationStockEntity.getMockData().first!)
    )
}

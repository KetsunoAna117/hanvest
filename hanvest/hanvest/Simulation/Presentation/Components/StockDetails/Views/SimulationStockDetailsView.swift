//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    var selectedStock: SimulationStockEntity
    
    @State private var initialPrice: Int = 0
    @State private var currentPrice: Int = 0
    
    var body: some View {
        VStack {
            StockHeaderInformationView(
                stockCodeName: selectedStock.stockIDName,
                stockName: selectedStock.stockName,
                initialPrice: $initialPrice,
                currentPrice: $currentPrice
            )
        }
        .padding(.horizontal, 20)
        .onAppear(){
            initialPrice = selectedStock.stockPrice.first?.stockPrice ?? 0
            currentPrice = selectedStock.stockPrice.last?.stockPrice ?? 0
        }

    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStock: SimulationStockEntity.getMockData().first!
    )
}

//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    var selectedStock: SimulationStockEntity
    
    @StateObject var viewmodel = SimulationStockDetailViewModel()
    
    var body: some View {
        VStack {
            StockHeaderInformationView(
                stockCodeName: selectedStock.stockIDName,
                stockName: selectedStock.stockName,
                initialPrice: $viewmodel.initialPrice,
                currentPrice: $viewmodel.currentPrice
            )
        }
        .padding(.horizontal, 20)

    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStock: SimulationStockEntity.getMockData().first!
    )
}

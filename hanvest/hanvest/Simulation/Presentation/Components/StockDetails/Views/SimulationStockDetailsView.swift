//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    var selectedStockID: String
    
    @StateObject private var viewmodel = SimulationStockDetailViewModel()
    
    @State private var initialPrice: Int = 0
    @State private var currentPrice: Int = 0
    
    var body: some View {
        VStack {
            StockHeaderInformationView(
                stockCodeName: viewmodel.simulationStock.stockName,
                stockName: viewmodel.simulationStock.stockName,
                initialPrice: $initialPrice,
                currentPrice: $currentPrice
            )
        }
        .onReceive(viewmodel.$simulationStock) { result in
            initialPrice = result.stockPrice.startIndex
            currentPrice = result.stockPrice.endIndex
        }

    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStockID: "BBRI"
    )
}

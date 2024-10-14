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
        .onAppear(){
            initialPrice = selectedStock.stockPrice.first?.stockPrice ?? 0
            currentPrice = selectedStock.stockPrice.last?.stockPrice ?? 0
        }

    }
}

#Preview {
    SimulationStockDetailsView(
        selectedStock: SimulationStockEntity(
            stockIDName: "BBRI",
            stockName: "Pt. Bank Rakyat Indonesia Tbk.",
            stockImageName: "bri",
            stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
            stockPrice: [
                SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-10 20:23:00")),
                SimulationStockPriceEntity(stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:33:00")),
                SimulationStockPriceEntity(stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:43:00")),
                SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:53:00"))
            ]
        )
    )
}

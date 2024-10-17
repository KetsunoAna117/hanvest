//
//  Module01SimulationStockEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

struct Module03ProductOfInvestmentEntity: Equatable {
    var productName: String
    var productPrices: [Module03ProductOfInvestmentPriceEntity]
    
    static func == (lhs: Module03ProductOfInvestmentEntity, rhs: Module03ProductOfInvestmentEntity) -> Bool {
        return
            lhs.productName == rhs.productName &&
            lhs.productPrices == rhs.productPrices
    }
    
    // Helper function to create SimulationStockPriceEntities every 15 days until day 165
    static func generateStockPriceEntities(startDate: String, initialPrice: Int) -> [Module03ProductOfInvestmentPriceEntity] {
        var stockPrices: [Module03ProductOfInvestmentPriceEntity] = []
        let initialDate = HanvestDateFormatter.stringToDate(startDate)
        let calendar = Calendar.current
        let dayIncrement = 15
        let maxDays = 105
        
        var currentDate = initialDate
        var currentPrice = initialPrice
        
        // Loop every 15 days, creating stock prices up to day 165
        for _ in stride(from: 0, through: maxDays, by: dayIncrement) {
            let newEntity = Module03ProductOfInvestmentPriceEntity(productName: "Deposito", productPrice: currentPrice, time: currentDate)
            stockPrices.append(newEntity)
            
            // Increment date by 15 days and simulate price change
            currentDate = calendar.date(byAdding: .day, value: dayIncrement, to: currentDate) ?? currentDate
            currentPrice += 100000000 // Example price increment logic, adjust as needed
        }
        
        return stockPrices
    }
    
    static func getMockData() -> [Module03ProductOfInvestmentEntity] {
        return [
            Module03ProductOfInvestmentEntity(
                productName: "Deposito",
                productPrices: generateStockPriceEntities(startDate: "2024-10-11 00:00:00", initialPrice: 300000000)
            ),
            Module03ProductOfInvestmentEntity(
                productName: "Government Bonds",
                productPrices: generateStockPriceEntities(startDate: "2024-10-11 00:00:00", initialPrice: 5000)
            ),
            Module03ProductOfInvestmentEntity(
                productName: "Stocks",
                productPrices: generateStockPriceEntities(startDate: "2024-10-11 00:00:00", initialPrice: 50)
            )
        ]
    }
}

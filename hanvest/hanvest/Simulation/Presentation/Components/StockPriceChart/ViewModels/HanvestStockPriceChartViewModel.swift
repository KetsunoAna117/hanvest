//
//  HanvestStockPriceChartViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation

class HanvestStockPriceChartViewModel: ObservableObject {
    @Published var stockPrices: [SimulationStockPriceEntity]
    
    var minStockPrice: Double {
        return stockPrices.map { Double($0.stockPrice) }.min() ?? 0.0
    }

    var maxStockPrice: Double {
        return stockPrices.map { Double($0.stockPrice) }.max() ?? 0.0
    }
    
    var yAxisStep: Double {
        // Example: Calculate step based on price range
        let priceRange = maxStockPrice - minStockPrice
        return round(priceRange / 5) // Adjust step size for readability
    }
    
    var lowerBound: Double {
        return (floor(minStockPrice / yAxisStep) * yAxisStep) - yAxisStep
    }
    
    var upperBound: Double {
        return (ceil(maxStockPrice / yAxisStep) * yAxisStep) + yAxisStep
    }
    
    var yAxisValues: [Double] {
        return stride(from: lowerBound, through: upperBound, by: yAxisStep).map { $0 }
    }
    
    var timeRange: Double {
        let startDate = stockPrices.first?.time ?? Date()
        let endDate = stockPrices.last?.time ?? Date()
        return Double(endDate.timeIntervalSince(startDate))
    }
    
    init(stockPrices: [SimulationStockPriceEntity]) {
        self.stockPrices = stockPrices
    }
}

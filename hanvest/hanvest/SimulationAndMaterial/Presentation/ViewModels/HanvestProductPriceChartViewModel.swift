//
//  HanvestStockPriceChartViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation

class HanvestProductPriceChartViewModel: ObservableObject {
    @Published var prices: [ProductPriceEntity]
    
    var minStockPrice: Double {
        return prices.map { Double($0.price) }.min() ?? 0.0
    }

    var maxStockPrice: Double {
        return prices.map { Double($0.price) }.max() ?? 0.0
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
        let startDate = prices.first?.time ?? Date()
        let endDate = prices.last?.time ?? Date()
        return Double(endDate.timeIntervalSince(startDate))
    }
    
    init(prices: [ProductPriceEntity]) {
        self.prices = prices
    }
}

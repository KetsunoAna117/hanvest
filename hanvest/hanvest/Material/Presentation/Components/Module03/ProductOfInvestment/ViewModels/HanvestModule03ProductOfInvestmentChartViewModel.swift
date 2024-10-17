//
//  HanvestModule03ProductOfInvestmentChartViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

class HanvestModule03ProductOfInvestmentViewModel: ObservableObject {
    @Published var productPrices: [Module03ProductOfInvestmentPriceEntity]
    
    var minStockPrice: Double {
        return productPrices.map { Double($0.productPrice) }.min() ?? 0.0
    }

    var maxStockPrice: Double {
        return productPrices.map { Double($0.productPrice) }.max() ?? 0.0
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
        let startDate = productPrices.first?.time ?? Date()
        let endDate = productPrices.last?.time ?? Date()
        return Double(endDate.timeIntervalSince(startDate))
    }
    
    init(productPrices: [Module03ProductOfInvestmentPriceEntity]) {
        self.productPrices = productPrices
    }
}

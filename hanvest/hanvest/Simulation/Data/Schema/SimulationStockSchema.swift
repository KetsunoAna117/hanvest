//
//  SimulationStockSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class SimulationStockSchema {
    @Attribute(.unique) var stockIDName: String
    var stockName: String?
    var stockImageName: String?
    var stockDescription: String?
    var stockPriceID: [String]?
    
    init(stockIDName: String, stockName: String? = nil, stockImageName: String? = nil, stockDescription: String? = nil, stockPriceID: [String]? = nil) {
        self.stockIDName = stockIDName
        self.stockName = stockName
        self.stockImageName = stockImageName
        self.stockDescription = stockDescription
        self.stockPriceID = stockPriceID
    }
    
    func mapToEntity(
        productPriceSchema: [ProductPriceSchema]
    ) -> SimulationStockEntity {
        return SimulationStockEntity(
            stockIDName: self.stockIDName,
            stockName: self.stockName ?? "",
            stockImageName: self.stockImageName ?? "",
            stockDescription: self.stockDescription ?? "",
            stockPrice: productPriceSchema.map({ $0.mapToEntity() })
        )
    }
}

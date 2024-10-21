//
//  StockInvestmentTransactionSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation
import SwiftData

@Model final class StockInvestmentTransactionSchema {
    @Attribute(.unique) var id: String
    var stockIDName: String?
    var priceAtPurchase: Int?
    var stockLotQuantity: Int?
    var time: Date?
    
    init(id: String, stockIDName: String? = nil, priceAtPurchase: Int? = nil, stockLotQuantity: Int? = nil, time: Date? = nil) {
        self.id = id
        self.stockIDName = stockIDName
        self.priceAtPurchase = priceAtPurchase
        self.stockLotQuantity = stockLotQuantity
        self.time = time
    }
    
    func update(stockInvestmentTransactionSchema: StockInvestmentTransactionSchema) {
        self.id = stockInvestmentTransactionSchema.id
        self.priceAtPurchase = stockInvestmentTransactionSchema.priceAtPurchase
        self.stockLotQuantity = stockInvestmentTransactionSchema.stockLotQuantity
        self.time = stockInvestmentTransactionSchema.time
    }
    
    func update(newPriceAtUpdate: Int) {
        self.priceAtPurchase = newPriceAtUpdate
    }
    
    func update(stockLotQuantity: Int) {
        self.stockLotQuantity = stockLotQuantity
    }
    
    func update(time: Date) {
        self.time = time
    }
    
    func mapToStockInvestmentTransactionEntity() -> StockInvestmentTransactionEntity {
        return StockInvestmentTransactionEntity(
            stockIDName: self.stockIDName ?? "",
            priceAtPurchase: self.priceAtPurchase ?? 0,
            stockLotQuantity: self.stockLotQuantity ?? 0,
            time: Date.distantPast
        )
    }
}

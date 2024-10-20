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
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
    
    init(id: String, stockIDName: String, priceAtPurchase: Int, stockLotQuantity: Int, time: Date) {
        self.id = id
        self.stockIDName = stockIDName
        self.priceAtPurchase = priceAtPurchase
        self.stockLotQuantity = stockLotQuantity
        self.time = time
    }
}

//
//  StockInvestmentTransaction.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct StockTransactionEntity {
    var transactionID: String
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
}

extension StockTransactionEntity {
    func mapToSchema() -> StockTransactionSchema {
        return StockTransactionSchema(
            id: self.transactionID,
            stockIDName: self.stockIDName,
            priceAtPurchase: self.priceAtPurchase,
            stockLotQuantity: self.stockLotQuantity,
            time: self.time
        )
    }
}

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

extension StockTransactionEntity {
    static func mock() -> [Self] {
        return [
            StockTransactionSchema(
                id: "transaction-01",
                stockIDName: "BBRI",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-40 * 60)
            ).mapToEntity()
            ,
            StockTransactionSchema(
                id: "transaction-02",
                stockIDName: "BBRI",
                priceAtPurchase: 5100,
                stockLotQuantity: 2,
                time: Date.now.addingTimeInterval(-30 * 60)
            ).mapToEntity()
            ,
            StockTransactionSchema(
                id: "transaction-03",
                stockIDName: "BBCA",
                priceAtPurchase: 7000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-20 * 60)
            ).mapToEntity()
            ,
            StockTransactionSchema(
                id: "transaction-04",
                stockIDName: "GOTO",
                priceAtPurchase: 50,
                stockLotQuantity: 10,
                time: Date.now.addingTimeInterval(-10 * 60)
            ).mapToEntity()
            
        ]
    }
}

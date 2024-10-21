//
//  StockInvestmentTransaction.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct StockInvestmentTransactionEntity {
    var transactionID: String
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
}

extension StockInvestmentTransactionEntity {
    func mapToSchema() -> StockInvestmentTransactionSchema {
        return StockInvestmentTransactionSchema(
            id: self.transactionID,
            stockIDName: self.stockIDName,
            priceAtPurchase: self.priceAtPurchase,
            stockLotQuantity: self.stockLotQuantity,
            time: self.time
        )
    }
}

extension StockInvestmentTransactionEntity {
    static func mock() -> [Self] {
        return [
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "BBRI",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "BBRI",
                priceAtPurchase: 5200,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "BBRI",
                priceAtPurchase: 5100,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "BBCA",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "BBCA",
                priceAtPurchase: 4000,
                stockLotQuantity: 3,
                time: Date.now
            ),
            .init(
                transactionID: UUID().uuidString,
                stockIDName: "GOTO",
                priceAtPurchase: 40,
                stockLotQuantity: 10,
                time: Date.now
            )
            
        ]
    }
}

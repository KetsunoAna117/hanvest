//
//  StockInvestmentTransaction.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct StockInvestmentTransaction {
    var transactionID: UUID = UUID()
    var stockIDName: String
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
}

extension StockInvestmentTransaction {
    static func BBRImock() -> [Self] {
        return [
            .init(
                stockIDName: "BBRI",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                stockIDName: "BBRI",
                priceAtPurchase: 5200,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                stockIDName: "BBRI",
                priceAtPurchase: 5100,
                stockLotQuantity: 1,
                time: Date.now
            )
        ]
    }
    
    static func BBCAmock() -> [Self] {
        return [
            .init(
                stockIDName: "BBCA",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                stockIDName: "BBCA",
                priceAtPurchase: 4000,
                stockLotQuantity: 3,
                time: Date.now
            ),
        ]
    }
    
    static func GOTOmock() -> [Self] {
        return [
            .init(
                stockIDName: "GOTO",
                priceAtPurchase: 40,
                stockLotQuantity: 10,
                time: Date.now
            )
        ]
    }
}

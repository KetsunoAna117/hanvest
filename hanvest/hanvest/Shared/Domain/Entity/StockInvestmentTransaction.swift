//
//  StockInvestmentTransaction.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct StockInvestmentTransaction {
    var transactionID: UUID = UUID()
    var priceAtPurchase: Int
    var stockLotQuantity: Int
    var time: Date
}

extension StockInvestmentTransaction {
    static func BBRImock() -> [Self] {
        return [
            .init(
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                priceAtPurchase: 5200,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                priceAtPurchase: 5100,
                stockLotQuantity: 1,
                time: Date.now
            )
        ]
    }
    
    static func BBCAmock() -> [Self] {
        return [
            .init(
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now
            ),
            .init(
                priceAtPurchase: 4000,
                stockLotQuantity: 3,
                time: Date.now
            ),
        ]
    }
    
    static func GOTOmock() -> [Self] {
        return [
            .init(
                priceAtPurchase: 40,
                stockLotQuantity: 10,
                time: Date.now
            )
        ]
    }
}

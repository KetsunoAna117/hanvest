//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserPurchasedLot {
    func execute(stockIDName: String) -> [StockInvestmentTransaction]
}

struct GetUserPurchasedLotImpl: GetUserPurchasedLot {
    func execute(stockIDName: String) -> [StockInvestmentTransaction] {
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
}

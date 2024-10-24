//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol FilterTransactionByStockIDName {
    func execute(stockIDName: String, user: UserDataEntity) -> [StockTransactionEntity]
}

struct FilterTransactionByStockIDNameImpl: FilterTransactionByStockIDName {
    func execute(stockIDName: String, user: UserDataEntity) -> [StockTransactionEntity] {
        let transactionQueue = user.transactionQueue
        return transactionQueue.filter({ transaction in
            transaction.stockIDName == stockIDName
        })
    }
}

//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserTransaction {
    func execute(stockIDName: String) -> [StockInvestmentTransactionEntity]
}

struct GetUserTransactionImpl: GetUserTransaction {
    func execute(stockIDName: String) -> [StockInvestmentTransactionEntity] {
        let user = UserDataEntity.mock()
        
        if let userStockInvestmentData = user.userInvestmentTransaction[stockIDName] {
            return userStockInvestmentData
        }
        return []
    }
}

//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserTransaction {
    func execute(stockIDName: String) -> [StockTransactionEntity]
}

struct GetUserTransactionImpl: GetUserTransaction {
    func execute(stockIDName: String) -> [StockTransactionEntity] {
        let user = UserDataEntity.mock()
        
        let res = user.userInvestmentTransaction.filter {
            $0.stockIDName == stockIDName
        }
        
        return res
    }
}

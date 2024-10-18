//
//  GetAvailableStockLot.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

protocol GetUserTransaction {
    func execute(stockIDName: String) -> [StockInvestmentTransaction]
}

struct GetUserTransactionImpl: GetUserTransaction {
    func execute(stockIDName: String) -> [StockInvestmentTransaction] {
        let user = UserData.getMockupUserData()
        
        if let userStockInvestmentData = user.userInvestmentTransaction[stockIDName] {
            return userStockInvestmentData
        }
        return []
    }
}

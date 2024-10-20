//
//  UserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct UserDataEntity {
    var userName: String
    var userBalance: Int
    var userRiskProfile: RiskProfileResultState
    var userInvestmentTransaction: [String: [StockInvestmentTransaction]]
    var transactionQueue: [StockInvestmentTransaction]
}

extension UserDataEntity {
    static func getMockupUserData() -> UserDataEntity {
        return UserDataEntity(
            userName: "Bryon",
            userBalance: 100000000,
            userRiskProfile: .aggresive,
            userInvestmentTransaction: [
                "BBCA" : StockInvestmentTransaction.BBCAmock(),
                "BBRI" : StockInvestmentTransaction.BBRImock(),
                "GOTO" : StockInvestmentTransaction.GOTOmock(),
            ],
            transactionQueue: [
                StockInvestmentTransaction(
                    stockIDName: "BBRI",
                    priceAtPurchase: 1000,
                    stockLotQuantity: 2,
                    time: Date.now
                )
            ]
        )
    }
}
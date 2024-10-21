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
    var userRiskProfile: RiskProfileType
    var userInvestmentTransaction: [StockInvestmentTransactionEntity]
    var transactionQueue: [StockInvestmentTransactionEntity]
    var moduleCompletionList: [CompletionEntityType]
}

extension UserDataEntity {
    static func getMockupUserData() -> UserDataEntity {
        return UserDataEntity(
            userName: "Bryon",
            userBalance: 2000000,
            userRiskProfile: .aggresive,
            userInvestmentTransaction: StockInvestmentTransactionEntity.mock(),
            transactionQueue: [
                StockInvestmentTransactionEntity(
                    stockIDName: "BBRI",
                    priceAtPurchase: 1000,
                    stockLotQuantity: 2,
                    time: Date.now
                )
            ],
            moduleCompletionList: [.module01, .module02]
        )
    }
}

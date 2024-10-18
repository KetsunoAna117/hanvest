//
//  UserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct UserData {
    var userName: String
    var userBalance: Int
    var userLotOwned: Int
    var userRiskProfile: RiskProfileResultState
    var userInvestmentTransaction: [String: [StockInvestmentTransaction]]
}

extension UserData {
    static func getMockupUserData() -> UserData {
        return UserData(
            userName: "Bryon",
            userBalance: 100000000,
            userInvestmentTransaction: [
                "BBCA" : StockInvestmentTransaction.BBCAmock(),
                "BBRI" : StockInvestmentTransaction.BBRImock(),
                "GOTO" : StockInvestmentTransaction.GOTOmock(),
            ],
            userLotOwned: 10,
            userRiskProfile: .aggresive
        )
    }
}

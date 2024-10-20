//
//  UserSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftData

@Model final class UserSchema {
    @Attribute(.unique) var id: String
    var userName: String
    var userBalance: Int
    var userRiskProfile: RiskProfileResultState
    var userInvestmentTransactionID: [String]
    var transactionQueueID: [String]
    
    init(id: String, userName: String, userBalance: Int, userRiskProfile: RiskProfileResultState, userInvestmentTransactionID: [String], transactionQueueID: [String]) {
        self.id = id
        self.userName = userName
        self.userBalance = userBalance
        self.userRiskProfile = userRiskProfile
        self.userInvestmentTransactionID = userInvestmentTransactionID
        self.transactionQueueID = transactionQueueID
    }
}

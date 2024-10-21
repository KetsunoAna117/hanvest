//
//  UserSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftData

@Model final class UserSchema {
    @Attribute(.unique) var userId: String
    var userName: String?
    var userBalance: Int?
    var userRiskProfile: RiskProfileType?
    var userInvestmentTransactionID: [String]?
    var transactionQueueID: [String]?
    var moduleCompletionIDList: [CompletionEntityType]?
    
    init(id: String, userName: String? = nil, userBalance: Int? = nil, userRiskProfile: RiskProfileType? = nil, userInvestmentTransactionID: [String]? = nil, transactionQueueID: [String]? = nil, moduleCompletionList: [CompletionEntityType]? = nil) {
        self.userId = id
        self.userName = userName
        self.userBalance = userBalance
        self.userRiskProfile = userRiskProfile
        self.userInvestmentTransactionID = userInvestmentTransactionID
        self.transactionQueueID = transactionQueueID
        self.moduleCompletionIDList = moduleCompletionList
    }
    
    func update(newUserData: UserSchema) {
        self.userName = newUserData.userName
        self.userBalance = newUserData.userBalance
        self.userRiskProfile = newUserData.userRiskProfile
        self.userInvestmentTransactionID = newUserData.userInvestmentTransactionID
        self.transactionQueueID = newUserData.transactionQueueID
    }
    
    func update(newBalance: Int) {
        self.userBalance = newBalance
    }
    
    func update(newName: String) {
        self.userName = newName
    }
    
    func update(newUserInvestmentTransactionID: [String]) {
        self.userInvestmentTransactionID = newUserInvestmentTransactionID
    }
    
    func update(newTransactionQueueID: [String]) {
        self.transactionQueueID = newTransactionQueueID
    }
    
    func mapToUserDataEntity(
        userInvestmentTransaction: [StockTransactionSchema],
        transactionQueue: [StockTransactionSchema],
        moduleCompletionList: [CompletionEntityType]
    ) -> UserDataEntity {
        return UserDataEntity(
            userId: self.userId,
            userName: self.userName ?? "",
            userBalance: self.userBalance ?? 0,
            userRiskProfile: self.userRiskProfile ?? .noData,
            userInvestmentTransaction: userInvestmentTransaction.map { $0.mapToStockInvestmentTransactionEntity() },
            transactionQueue: transactionQueue.map { $0.mapToStockInvestmentTransactionEntity() },
            moduleCompletionList: self.moduleCompletionIDList ?? []
        )
    }
}

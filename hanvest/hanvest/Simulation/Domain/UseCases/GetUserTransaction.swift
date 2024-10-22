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
    let userRepo: UserRepository
    let transactionRepo: StockTransactionRepository
    
    func execute(stockIDName: String) -> [StockTransactionEntity] {
        guard let user = userRepo.fetch()
        else {
            return []
        }
        
        let transactionQueueID = user.transactionQueueID
        return transactionQueueID.compactMap { id in
            if let data = transactionRepo.fetch(id: id) {
                return data.mapToEntity()
            }
            return nil
        }
    }
}

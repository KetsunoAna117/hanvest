//
//  StockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

protocol StockInvestmentRepository {
    func get() -> [StockInvestmentTransactionSchema]
    func save(_ transaction: StockInvestmentTransactionSchema) throws
    func delete(_ transactionID: String) throws
    func update(id: String, price: Int) throws
    func update(id: String, stockLotQty: Int) throws
    func update(id: String, time: Date) throws
}

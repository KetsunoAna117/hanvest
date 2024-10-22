//
//  StockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation

protocol StockInvestmentRepository {
    func fetch() -> [StockTransactionSchema]
    func fetch(id: String) -> StockTransactionSchema?
    func save(_ transaction: StockTransactionSchema) throws
    func delete(_ transactionID: String) throws
    func update(id: String, price: Int) throws
    func update(id: String, stockLotQty: Int) throws
    func update(id: String, time: Date) throws
}

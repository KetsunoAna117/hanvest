//
//  LocalStockInvestmentRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

struct LocalStockInvestmentRepository: StockInvestmentRepository {
    let modelContext: SwiftDataContextManager
    
    func get() -> [StockInvestmentTransactionSchema] {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>()
                return try context.fetch(descriptor)
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
    
    func save(_ transaction: StockInvestmentTransactionSchema) throws {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>(
                    predicate: #Predicate { $0.id == transaction.id }
                )
                
                if let transaction = try context.fetch(descriptor).first {
                    throw SwiftDataError.alreadyExists
                }
                
                context.insert(transaction)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func delete(_ transactionID: String) {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>(
                    predicate: #Predicate { $0.id == transactionID }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                context.delete(transaction)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    func update(id: String, price: Int) {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>(
                    predicate: #Predicate { $0.id == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(newPriceAtUpdate: price)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    func update(id: String, stockLotQty: Int) {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>(
                    predicate: #Predicate { $0.id == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(stockLotQuantity: stockLotQty)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    func update(id: String, time: Date) {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<StockInvestmentTransactionSchema>(
                    predicate: #Predicate { $0.id == id }
                )
                
                guard let transaction = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                transaction.update(time: time)
                try? context.save()
            }
            catch {
                debugPrint("Error Fetch Data: ", error)
            }
        }
    }
    
    
}

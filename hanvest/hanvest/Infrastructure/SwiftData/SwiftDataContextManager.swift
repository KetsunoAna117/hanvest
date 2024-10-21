//
//  SwiftDataContextManager.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation
import SwiftData

public class SwiftDataContextManager {
    public static var shared = SwiftDataContextManager()
    var container: ModelContainer?
    var context: ModelContext?
    
    init() {
        do {
            container = try ModelContainer(
                for: UserSchema.self, StockTransactionSchema.self
            )
            
            if let container {
                context = ModelContext(container)
                prepopulateUserData()
            }
        } catch {
            debugPrint("Error initializing database container:", error)
        }
    }
}

private extension SwiftDataContextManager {
    func saveUserData(userDataSchema: UserSchema) {
        if let context{
            context.insert(userDataSchema)
        }
    }
    
    func saveStockTransactionData(stockTransaction: StockTransactionSchema){
        if let context {
            context.insert(stockTransaction)
        }
    }
    
    func fetchUserSchema() -> UserSchema? {
        if let context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                let userSchema = try context.fetch(descriptor)
                return userSchema.first
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return nil
    }
    
    func fetchTransactionSchema() -> [StockTransactionSchema] {
        if let context {
            do {
                let descriptor = FetchDescriptor<StockTransactionSchema>()
                let result = try context.fetch(descriptor)
                return result
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
        return []
    }
}

private extension SwiftDataContextManager {
    func prepopulateUserData() {
        let userSchemaData = fetchUserSchema()
        let transactionSchemaData = fetchTransactionSchema()
        
        if userSchemaData == nil {
            let result = getMockUserSchemaData()
            saveUserData(userDataSchema: result)
        }
        
        if transactionSchemaData.count <= 0 {
            let result = getMockTransactionSchemaData()
            for data in result {
                saveStockTransactionData(stockTransaction: data)
            }
        }
    }
    
    func getMockUserSchemaData() -> UserSchema {
        return  UserSchema(
            id: UUID().uuidString,
            userName: "Bryon",
            userBalance: 0,
            userRiskProfile: .conservative,
            userInvestmentTransactionID: [
                "transaction-01",
                "transaction-02",
                "transaction-03"
            ],
            transactionQueueID: [
                "transaction-04"
            ]
        )
    }
    
    func getMockTransactionSchemaData() -> [StockTransactionSchema] {
        return [
            StockTransactionSchema(
                id: "transaction-01",
                stockIDName: "BBRI",
                priceAtPurchase: 5000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-40 * 60)
            ),
            StockTransactionSchema(
                id: "transaction-02",
                stockIDName: "BBRI",
                priceAtPurchase: 5100,
                stockLotQuantity: 2,
                time: Date.now.addingTimeInterval(-30 * 60)
            ),
            StockTransactionSchema(
                id: "transaction-03",
                stockIDName: "BBCA",
                priceAtPurchase: 7000,
                stockLotQuantity: 1,
                time: Date.now.addingTimeInterval(-20 * 60)
            ),
            StockTransactionSchema(
                id: "transaction-04",
                stockIDName: "GOTO",
                priceAtPurchase: 50,
                stockLotQuantity: 10,
                time: Date.now.addingTimeInterval(-10 * 60)
            )
        ]
    }
}

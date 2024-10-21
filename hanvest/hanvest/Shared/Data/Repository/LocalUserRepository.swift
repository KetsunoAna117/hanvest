//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation
import SwiftData

struct LocalUserRepository: UserRepository {
    let modelContext: SwiftDataContextManager
    
    func get() -> UserSchema? {
        if let context = modelContext.context {
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
    
    func save(_ userSchema: UserSchema) {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<UserSchema>(
                    predicate: #Predicate{ $0.id == userSchema.id}
                )
                
                guard var fetchedUserSchema = try context.fetch(descriptor).first else {
                    // Create new user if not found
                    context.insert(userSchema)
                    try? context.save()
                    return
                }
                
                // Update if found
                fetchedUserSchema.update(newUserData: userSchema)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func update(balance: Int) throws {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                guard var fetchedUserSchema = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                fetchedUserSchema.update(newBalance: balance)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func update(name: String) throws {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                guard var fetchedUserSchema = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                fetchedUserSchema.update(newName: name)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func update(userTransaction: [String]) throws {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                guard var fetchedUserSchema = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                fetchedUserSchema.update(newUserInvestmentTransactionID: userTransaction)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    func update(transactionQueue: [String]) throws {
        if let context = modelContext.context {
            do {
                let descriptor = FetchDescriptor<UserSchema>()
                guard var fetchedUserSchema = try context.fetch(descriptor).first else {
                    throw SwiftDataError.notFound
                }
                
                fetchedUserSchema.update(newTransactionQueueID: transactionQueue)
                try? context.save()
                
            }
            catch {
                debugPrint("Error Fetch Data:",error)
            }
        }
    }
    
    
}

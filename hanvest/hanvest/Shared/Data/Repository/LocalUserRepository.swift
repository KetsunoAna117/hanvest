//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct LocalUserRepository: UserRepository {
    let modelContext: SwiftDataContextManager
    
    func get() -> UserSchema {
        return modelContext.context.
    }
    
    func update(_ userSchema: UserSchema) {
        
    }
    
    
}

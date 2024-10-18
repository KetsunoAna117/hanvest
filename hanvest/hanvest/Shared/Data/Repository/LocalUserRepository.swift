//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import Foundation

struct LocalUserRepository: UserRepository {
    func get() -> UserSchema {
        return UserSchema()
    }
    
    func update(_ userSchema: UserSchema) {
        
    }
    
    
}

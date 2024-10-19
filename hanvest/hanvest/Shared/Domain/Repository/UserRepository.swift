//
//  UserRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

protocol UserRepository {
    func get() -> UserSchema
    func update(_ userSchema: UserSchema) -> Void
}

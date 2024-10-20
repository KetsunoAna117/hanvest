//
//  GetUserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

protocol GetUserData {
    func execute() -> UserDataEntity
}

struct GetUserDataImpl: GetUserData {
    func execute() -> UserDataEntity {
        return UserDataEntity.getMockupUserData()
    }
}

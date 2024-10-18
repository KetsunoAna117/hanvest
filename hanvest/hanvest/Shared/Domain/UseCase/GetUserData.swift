//
//  GetUserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

protocol GetUserData {
    func execute() -> UserData
}

struct GetUserDataImpl: GetUserData {
    func execute() -> UserData {
        return UserData.getMockupUserData()
    }
}

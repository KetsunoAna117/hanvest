//
//  UserData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct UserData {
    var userName: String
    var userBalance: Int
}

extension UserData {
    static func getMockupUserData() -> UserData {
        return UserData(userName: "Bryon", userBalance: 100000000)
    }
}

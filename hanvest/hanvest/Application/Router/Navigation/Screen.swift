//
//  Screen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation

enum Screen: Identifiable, Hashable {
    case debug
    case onboarding
    case main
    
    var id: Self { return self }
}

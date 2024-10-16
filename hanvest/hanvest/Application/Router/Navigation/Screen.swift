//
//  Screen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation

enum Screen: Identifiable, Hashable {
    case contentview
    case onboarding
    case material
    case simulation
    case profile
    case resources
    
    var id: Self { return self }
}

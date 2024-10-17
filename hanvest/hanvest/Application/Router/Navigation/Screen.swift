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
    case materialModule01
    case materialModule02
    case materialModule03
    case materialModule04
    
    var id: Self { return self }
}

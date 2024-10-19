//
//  HanvestModuleNumberState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 09/10/24.
//

import SwiftUI

enum HanvestModuleNumberDefaultStyle {
    case current
    case done
    case next
    
    var backgroundColor: Color {
        switch self {
            case .current:
                return .lemonChiffon500
            case .done:
                return .seagull400
            case .next:
                return .mineShaft400
        }
    }
    
    var shadowColor: Color {
        switch self {
            case .current:
                return .lemonChiffon600
            case .done:
                return .seagull500
            case .next:
                return .mineShaft500
        }
    }
}

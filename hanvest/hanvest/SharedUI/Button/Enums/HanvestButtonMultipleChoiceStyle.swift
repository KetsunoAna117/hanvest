//
//  HanvestButtonSelectedState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 23/10/24.
//

import SwiftUI

enum HanvestButtonMultipleChoiceStyle {
    case selected
    case unselected
    
    var backgroundColor: Color {
        switch self {
            case .selected:
                return .seagull400
            case .unselected:
                return .mineShaft50
        }
    }
    
    var fontColor: Color {
        switch self {
            case .selected:
                return .mineShaft50
            case .unselected:
                return .seagull500
        }
    }
    
    var borderColor: Color {
        switch self {
            case .selected:
                return .seagull400
            case .unselected:
                return .seagull300
        }
    }
    
    var shadowColor: Color {
        switch self {
            case .selected:
                return .seagull500
            case .unselected:
                return .seagull300
        }
    }
}

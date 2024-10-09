//
//  HanvestButtonDefaultStyle.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonDefaultStyle {
    case filled
    case bordered
    case borderless
    
    var backgroundColor: Color {
        switch self {
            case .filled: return .seagull400
            case .bordered: return .mineShaft50
            case .borderless: return .clear
        }
    }
    
    var fontColor: Color {
        switch self {
            case .filled: return .mineShaft50
            case .bordered: return .seagull400
            case .borderless: return .seagull400
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled:
            return .seagull400
        case .bordered:
            return .seagull400
        case .borderless:
            return .clear
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .filled:
            return .seagull500
        case .bordered:
            return .seagull500
        case .borderless:
            return .clear
        }
    }
}

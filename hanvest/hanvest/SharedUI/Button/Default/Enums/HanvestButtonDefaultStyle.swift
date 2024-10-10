//
//  HanvestButtonDefaultStyle.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonDefaultStyle {
    case filled(isDisabled: Bool)
    case bordered(isDisabled: Bool)
    case borderless(isDisabled: Bool)
    case filledCorrect(isDisabled: Bool)
    case filledIncorrect(isDisabled: Bool)
    
    // Computed property that extracts the isDisabled alignment for any case
    var isDisabled: Bool {
        switch self {
        case .filled(let isDisabled),
                .bordered(let isDisabled),
                .borderless(let isDisabled),
                .filledCorrect(let isDisabled),
                .filledIncorrect(let isDisabled):
            return isDisabled
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .fillTertiary : .seagull400
        case .bordered(let isDisabled):
            return isDisabled ? .clear : .mineShaft50
        case .borderless:
            return .clear
        case .filledCorrect(let isDisabled):
            return isDisabled ? .fillTertiary : .blizzardBlue400
        case .filledIncorrect(let isDisabled):
            return isDisabled ? .fillTertiary : .sundown500
        }
    }
    
    var fontColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .labelTertiary : .mineShaft50
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull500
        case .borderless(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull500
        case .filledCorrect(let isDisabled):
            return isDisabled ? .labelTertiary : .mineShaft50
        case .filledIncorrect(let isDisabled):
            return isDisabled ? .labelTertiary : .mineShaft50
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled(_):
            return .clear
        case .bordered(let isDisabled):
            return isDisabled ? .labelTertiary : .seagull300
        case .borderless, .filledCorrect, .filledIncorrect:
            return .clear
        }
    }
    
    var shadowColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .clear : .seagull500
        case .bordered(let isDisabled):
            return isDisabled ? .clear : .seagull300
        case .borderless:
            return .clear
        case .filledCorrect(let isDisabled):
            return isDisabled ? .clear : .blizzardBlue500
        case .filledIncorrect(let isDisabled):
            return isDisabled ? .clear : .sundown600
        }
    }
}

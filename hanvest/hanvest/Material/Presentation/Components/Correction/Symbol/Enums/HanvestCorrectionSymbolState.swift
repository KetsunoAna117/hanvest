//
//  HanvestCorrectionSymbolState.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 10/10/24.
//

import SwiftUI

enum HanvestCorrectionSymbolState {
    case correct
    case incorrect
    
    var backgroundColor: Color {
        switch self {
            case .correct: return .blizzardBlue400
            case .incorrect: return .sundown500
        }
    }
    
    var fontColor: Color {
        switch self {
            case .correct, .incorrect:
                return .mineShaft50
        }
    }
    
    var icon: String {
        switch self {
        case .correct:
            return "checkmark"
        case .incorrect:
            return "xmark"
        }
    }
}

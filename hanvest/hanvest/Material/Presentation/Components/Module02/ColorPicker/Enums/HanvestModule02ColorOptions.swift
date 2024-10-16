//
//  HanvestModule02ColorPicker.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum HanvestModule02ColorOptions: CaseIterable {
    case beige
    case sandpaper
    case semiWhite
    case spaceGray
    
    var colorOptions: Color {
        switch self {
            case .beige:
                return .beige
            case .sandpaper:
                return .sandpaper
            case .semiWhite:
                return .semiWhite
            case .spaceGray:
                return .spaceGray
        }
    }
}

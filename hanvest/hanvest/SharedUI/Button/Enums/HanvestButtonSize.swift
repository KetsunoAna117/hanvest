//
//  HanvestButtonSize.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonSize {
    case large
    case medium
    
    var minWidth: CGFloat {
        switch self {
        case .large:
            return 351
        case .medium:
            return 170
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .large:
            return 14
        case .medium:
            return 8.5
        }
    }
}

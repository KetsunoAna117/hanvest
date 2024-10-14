
//
//  HanvestStockOptionDefaultState.swift
//  hanvest
//
//  Created by Christian Gunawan on 11/10/24.
//

import SwiftUI

enum HanvestStockOptionDefaultState: Equatable{
    case unselected(color: Color)
    case selected(color: Color)
    
    var backgroundColor: Color{
        switch self {
        case .unselected(_):
            return .mineShaft500
        case .selected(let color):
            return color
        }
    }
    
    var shadowColor: Color{
        switch self {
        case .unselected:
            return .mineShaft700
        case .selected(let color):
            return color
        }
    }
}

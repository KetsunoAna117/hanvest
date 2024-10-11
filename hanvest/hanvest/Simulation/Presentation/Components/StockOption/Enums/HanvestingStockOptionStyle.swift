//
//  HanvestingStockOptionStyle.swift
//  hanvest
//
//  Created by Christian Gunawan on 11/10/24.
//


import SwiftUI

enum HanvestingStockOptionStyle {
    case filled(isDisabled: Bool)
    
    // Computed property that extracts the isDisabled alignment for any case
    var isDisabled: Bool {
        switch self {
        case .filled(let isDisabled):
            return isDisabled
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .fillTertiary : .seagull900

        }
    }
    
    var fontColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .labelTertiary : .mineShaft50
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled(_):
            return .clear

        }
    }
    
    var shadowColor: Color {
        switch self {
        case .filled(let isDisabled):
            return isDisabled ? .clear : .seagull950
        }
    }
}

//
//  HanvestIconPosition.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 09/10/24.
//

import SwiftUI

enum HanvestButtonIconPosition {
    case leading
    case trailing
    case hidden
    
    var alignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        case .hidden:
            return .center
        }
    }
}

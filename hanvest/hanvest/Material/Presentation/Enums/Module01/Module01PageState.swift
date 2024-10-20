//
//  Module01PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module01PageState: Int {
    case pageModuleMaterial
    case pageClaimReward = 1
    
    var buttonStringValue: String {
        switch self {
            case .pageModuleMaterial, .pageClaimReward:
                "Continue"
        }
    }
}

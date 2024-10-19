//
//  Module01PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module01PageState: Int {
    case pageModuleMaterial
    case pageClaimReward = 2
    
    var buttonStringValue: String {
        switch self {
            case .pageModuleMaterial:
                "Continue"
            case .pageClaimReward:
                "Claim Reward"
        }
    }
}

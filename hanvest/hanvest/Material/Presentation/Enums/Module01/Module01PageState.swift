//
//  Module01PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

enum Module01PageState: Int {
    case moduleMaterial = 0
    case claimReward = 2
    
    var buttonStringValue: String {
        switch self {
            case .moduleMaterial:
                "Continue"
            case .claimReward:
                "Claim Reward"
        }
    }
}

//
//  Module03PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

enum Module03PageState: Int {
    case pageContinue
    case pageNextMonth
    case pageClaimReward = 6
    
    var buttonStringValue: String {
        switch self {
            case .pageContinue:
                "Continue"
            case .pageNextMonth:
                "Next Month"
            case .pageClaimReward:
                "Claim Reward"
        }
    }

}

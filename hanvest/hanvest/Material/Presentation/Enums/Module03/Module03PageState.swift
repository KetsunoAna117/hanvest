//
//  Module03PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import Foundation

enum Module03PageState: Int {
    case pageContinue
    case pageNextMonth
    case pageClaimReward = 5
    
    var buttonStringValue: String {
        switch self {
            case .pageContinue, .pageClaimReward:
                "Continue"
            case .pageNextMonth:
                "Next Month"
        }
    }
}

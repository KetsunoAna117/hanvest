//
//  Module02PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import Foundation

enum Module02PageState: Int {
    case pageContinue
    case pageCheckout
    case pagePay
    case pageClaimReward = 10
    
    var buttonStringValue: String {
        switch self {
            case .pageContinue:
                "Continue"
            case .pageCheckout:
                "Checkout"
            case .pagePay:
                "Pay"
            case .pageClaimReward:
                "Claim Reward"
        }
    }

}

//
//  Module04PageState.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import Foundation

enum Module04PageState: Int {
    case pageStartQuiz
    case pageContinue
    case pageClaimReward = 10
    
    var buttonStringValue: String {
        switch self {
            case .pageStartQuiz:
                "Start Quiz"
            case .pageContinue, .pageClaimReward:
                "Continue"
        }
    }
}

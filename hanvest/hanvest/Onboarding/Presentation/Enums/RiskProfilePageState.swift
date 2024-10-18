//
//  RiskProfileStatus.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import Foundation

enum RiskProfilePageState: Int {
    case pageOpening = 0
    case pageQuestion
    case pageRiskResult = 7
    
    var buttonStringValue: String {
        switch self {
            case .pageOpening: 
                "Start"
            case .pageQuestion: 
                "Continue"
            case .pageRiskResult:
                "Done"
        }
    }
}

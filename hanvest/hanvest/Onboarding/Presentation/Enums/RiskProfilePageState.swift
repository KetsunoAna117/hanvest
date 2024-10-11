//
//  RiskProfileStatus.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import Foundation

enum RiskProfilePageState {
    case openingPage
    case questionPage
    case resultPage
    
    var buttonStringValue: String {
        switch self {
            case .openingPage: 
                "Start"
            case .questionPage: 
                "Continue"
            case .resultPage:
                "Done"
        }
    }
}

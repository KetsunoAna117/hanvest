//
//  RiskProfileStatus.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import Foundation

enum RiskProfilePageState: Int {
    case openingPage = 0
    case questionPage
    case resultPage = 7
    
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

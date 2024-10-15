//
//  RiskProfileResult.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import SwiftUI

enum RiskProfileResultState {
    case conservative
    case moderate
    case aggresive
    case veryAggresive
    
    // TODO: Adjust the image name after inserting asset later
    var riskImage: Image {
        switch self {
            case .conservative:
                Image("risk-profile-conservative-badge")
            case .moderate:
                Image("risk-profile-moderate-badge")
            case .aggresive:
                Image("risk-profile-aggresive-badge")
            case .veryAggresive:
                Image("risk-profile-very-aggresive-badge")
        }
    }
    
    var riskHeaderText: String {
        switch self {
            case .conservative:
                "Conservative"
            case .moderate:
                "Moderate"
            case .aggresive:
                "Aggresive"
            case .veryAggresive:
                "Very Aggresive"
        }
    }
    
    var riskDetailText: String {
        switch self {
            case .conservative:
                "Prefers low-risk investments with stable returns. Focuses on capital preservation over growth, such as bonds or savings accounts."
            case .moderate:
                "Balances risk and return, opting for a mix of lower-risk assets like bonds and higher-risk assets like stocks, aiming for steady growth over time."
            case .aggresive:
                "Willing to take higher risks for potentially greater returns. Primarily invests in stocks and other volatile assets."
            case .veryAggresive:
                "Seeks maximum returns by taking the highest level of risk, focusing on high-growth stocks, speculative investments, and emerging markets."
        }
    }
}

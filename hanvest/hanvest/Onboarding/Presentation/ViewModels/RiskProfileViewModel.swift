//
//  RiskProfileViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import Foundation

@Observable
class RiskProfileViewModel {
    var resultState: RiskProfileType = .conservative
    var userSelectedAnswers = Array(repeating: "", count: RiskProfileQuestionsAndOptions.allCases.count)
    
    func calculateRiskProfile() -> RiskProfileType {
        // add logic to calculate risk profile from the 'userSelectedAnswers' variable
        
        return .conservative
    }
}

//
//  HanvestMultipleChoiceViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import Foundation

@Observable
class HanvestMultipleChoiceViewModel {
    var selectedAnswer: String?
    
    func updateSelectedAnswer(_ answer: String) {
        selectedAnswer = answer
    }
}

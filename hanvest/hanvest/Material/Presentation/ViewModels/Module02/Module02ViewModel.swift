//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

@Observable
class Module02ViewModel {
    var userSelectedAnswers = Array(repeating: "", count: Module02TextImageChoices.allCases.count + 1)
    
    func checkUserLastSelectedAnswer() -> Bool {
        if let page07choices = Module02TextImageChoices.page07.choicesText {
            return (userSelectedAnswers.last == page07choices.first)
        }
        
        return false
    }
}

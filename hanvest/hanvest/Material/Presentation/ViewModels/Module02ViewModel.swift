//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

@Observable
class Module02ViewModel {
    var userSelectedAnswers = Array(repeating: "", count: Module02PageLoopSegmentation.textImageWithButtonDefault.pageSegmentation.count)
    
    func checkUserLastSelectedAnswer() -> Bool {
        if let page07Content = Module02PageState.page07.page07Content {
            return (userSelectedAnswers[Module02PageLoopSegmentation.textImageWithButtonDefault.pageSegmentation.count - 1] == page07Content.choices.first)
        }
        
        return false
    }
}

//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

@Observable
class Module02ViewModel {
    // TODO: last index always bug, idk why need to exceess count by + 1
    var userSelectedAnswers = Array(repeating: "", count: 8)
    
    func checkUserLastSelectedAnswer() -> Bool {
        return (userSelectedAnswers.last == Module02MultipleChoice.page07.options.first)
    }
}

//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

class Module04ViewModel: ObservableObject {
    @Published var userSelectedAnswer: String = ""
    
    func parseUserAnswerIfIsWrong(page: Module04MultipleChoice) -> String? {
        if userSelectedAnswer != page.answers {
            return userSelectedAnswer
        } else {
            return nil
        }
    }
    
    func checkUserAnswerTrueOrFalse(currentTab: Int) -> Bool {
        if let currentPage = Module04MultipleChoice(rawValue: currentTab) {
            return userSelectedAnswer == currentPage.answers
        } else {
            return false
        }
    }
    
    func resetUserSelectedAnswer() {
        userSelectedAnswer = ""
    }
}

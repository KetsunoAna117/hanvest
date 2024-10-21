//
//  Module02ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import Foundation

class Module02ViewModel: ObservableObject {
    // TODO: last index always bug, idk why need to exceess count by + 1
    @Published var userSelectedAnswers = Array(repeating: "", count: Module02HeaderWithDetailText.page10.rawValue)
    
    func checkDebitOrPayLater() -> Bool {
        return userSelectedAnswers.contains(where: { $0 == Module02MultipleChoice.page07.options.first })
    }
    
    func checkIphoneOrIphoneProMax() -> String {
        guard let firstOption = Module02MultipleChoice.page03.options.first,
              let lastOption = Module02MultipleChoice.page03.options.last else {
            return ""
        }
        
        if userSelectedAnswers.contains(where: { $0 == firstOption }) {
            return firstOption
        } else {
            return lastOption
        }
    }
}

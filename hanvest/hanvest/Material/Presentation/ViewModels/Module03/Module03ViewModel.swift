//
//  Module04ViewModel.swift
//  hanvest
//
//  Created by Bryan Vernanda on 19/10/24.
//

import Foundation

class Module03ViewModel: ObservableObject {
    @Published var selectedProductIndex: Int = -1
    
    func checkSelectedProductIndex(answer: String) {
        for optionCase in Module03MultipleChoice.allCases {
            if let index = optionCase.options.firstIndex(of: answer) {
                self.selectedProductIndex = index
                return
            }
        }
    }
}

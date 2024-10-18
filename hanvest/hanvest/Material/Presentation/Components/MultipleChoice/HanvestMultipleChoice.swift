//
//  MultipleChoice.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMultipleChoice: View {
    // Constants
    let question: String
    let options: [String]
    
    var onSelectAnswer: ((String) -> Void)
    
    @State private var moneyBalance: Int = 10000000
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 0) {
                Text(question)
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                if question.contains(Module03MultipleChoice.page01.question) {
                    Text("Balance: Rp. \(moneyBalance)")
                        .font(.nunito(.callout))
                        .frame(maxWidth: .infinity)
                }

            }
            .multilineTextAlignment(.center)
            
            ForEach(options, id: \.self) { option in
                HanvestButtonRadioBehavior(
                    style: .bordered(isDisabled: false),
                    selectedButtonID: $selectedButtonID,
                    title: option,
                    action: {
                        onAnswered()
                        onSelectAnswer(option)
                    }
                )
                .font(.nunito(.body))
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func onAnswered() {
        self.moneyBalance = 0
    }
}

#Preview {
    @Previewable let question = "What is your favorite programming language?"
    @Previewable let options = ["Swift", "Java", "Python"]
    
    HanvestMultipleChoice(
        question: question,
        options: options,
        onSelectAnswer: {_ in }
    )
    .padding(.horizontal, 20)
}

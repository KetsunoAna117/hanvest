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
    
    var image: Image?
    var correctAnswer: String?
    var wrongAnswer: String?
    var customSpacing: CGFloat?
    var onSelectAnswer: ((String) -> Void)
    
    @State private var moneyBalance: Int = 10000000
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: (customSpacing != nil) ? customSpacing : 0) {
                VStack(spacing: (customSpacing != nil) ? customSpacing : 24) {
                    
                    Text(question)
                        .font(.nunito(.title2))
                        .frame(maxWidth: .infinity)
                    
                    if let image = image{
                        image
                    }
                    
                }
                
                if checkIfQuestionIsModule03() {
                    Text("Balance: Rp. \(moneyBalance)")
                        .font(.nunito(.callout))
                        .frame(maxWidth: .infinity)
                }

            }
            .multilineTextAlignment(.center)
            
            ForEach(Array(options.enumerated()), id: \.element) { index, option in
                HanvestButtonRadioBehavior(
                    style: determineButtonStyle(option: option),
                    selectedButtonID: $selectedButtonID,
                    title: option,
                    image: determineButtonImage(option: option),
                    action: {
                        radioButtonAction(option: option)
                    }
                )
                .font(.nunito(.body))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func radioButtonAction(option: String) {
        if checkIfQuestionIsModule03() {
            moneyBalance = 0
        }
        
        if correctAnswer == nil {
            onSelectAnswer(option)
        }
    }
    
    private func checkIfQuestionIsModule03() -> Bool {
        return (question.contains(Module03MultipleChoice.page01.question))
    }
    
    private func checkAnswer(option: String) -> (isCorrect: Bool, isIncorrect: Bool) {
        let isCorrect = (option == correctAnswer)
        let isIncorrect = (option == wrongAnswer)
        return (isCorrect, isIncorrect)
    }
    
    private func determineButtonStyle(option: String) -> HanvestButtonStyle {
        let result = checkAnswer(option: option)
        
        if result.isCorrect {
            return .filledCorrect(isDisabled: false)
        } else if result.isIncorrect {
            return .filledIncorrect(isDisabled: false)
        } else {
            return .bordered(isDisabled: false)
        }
    }
    
    private func determineButtonImage(option: String) -> Image? {
        let result = checkAnswer(option: option)
        
        if result.isCorrect {
            return Image(systemName: "checkmark")
        } else if result.isIncorrect {
            return Image(systemName: "xmark")
        } else {
            return nil
        }
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

//
//  HanvestMultipleChoiceView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import SwiftUI

struct HanvestMultipleChoiceView: View {
    // Constants
    let question: String
    let answers: [String]
    
    // View Model
    @State private var viewModel = HanvestMultipleChoiceViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("\(question)")
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                ForEach(answers, id: \.self) { answer in
                    HanvestButtonDefault(
                        style: .bordered(
                            isDisabled: false
                        ),
                        title: answer,
                        action: {
                            viewModel.updateSelectedAnswer(answer)
                        }
                    )
                    .font(.nunito(.body))
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestMultipleChoiceView(
        question:
            "Are you new to stock market?",
        answers:
            [
                "Yes, I'm completely new.",
                "I've done some research.",
                "I’ve invested a little, but I’m still learning.",
                "I’ve Invested and understand how it work."
            ]
    )
}

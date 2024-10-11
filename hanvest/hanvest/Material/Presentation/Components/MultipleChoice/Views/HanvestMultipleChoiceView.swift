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
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                Text("\(question)")
                    .font(.nunito(.title2))
                    .frame(maxWidth: .infinity)
                
                ForEach(answers, id: \.self) { answer in
                    HanvestButtonRadioBehavior(
                        style: .bordered(
                            isDisabled: false
                        ),
                        selectedButtonID: $selectedButtonID,
                        title: answer,
                        action: {
                            // TODO: Change this into doing something
                            print("\(selectedButtonID)")
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

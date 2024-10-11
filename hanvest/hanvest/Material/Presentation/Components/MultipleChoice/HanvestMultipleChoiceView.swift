//
//  HanvestMultipleChoiceView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 11/10/24.
//

import SwiftUI

struct HanvestMultipleChoiceView: View {
    let question: String
    let answers: [String]
    
    var body: some View {
        ZStack {
            Text("\(question)")
        }
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

//
//  HanvestTextImageWithButtonDefault.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct HanvestTextImageWithButtonDefault: View {
    // Constants
    let headerText: String
    let image: Image
    let textAndImageSpacing: CGFloat
    let choices: [String]
    
    @State private var selectedButtonID = ""
    
    var onSelectAnswer: (String) -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            HanvestTextWithImageView(
                headerText: headerText,
                image: image,
                textAndImageSpacing: textAndImageSpacing
            )
            .frame(maxWidth: .infinity)
            
            ForEach(choices, id: \.self) { choice in
                HanvestButtonRadioBehavior(
                    style: .bordered(
                        isDisabled: false
                    ),
                    selectedButtonID: $selectedButtonID,
                    title: choice,
                    action: {
                        onSelectAnswer(choice)
                    }
                )
                .font(.nunito(.body))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    HanvestTextImageWithButtonDefault(
        headerText: "Now choose the type of iphone you want to get",
        image: Image("iphone-pic-01"),
        textAndImageSpacing: 65,
        choices: [
            "Iphone 16",
            "Iphone 16 Pro Max"
        ],
        onSelectAnswer: {_ in }
    )
}

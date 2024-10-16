    //
//  SelectibleOption.swift
//  hanvest
//
//  Created by Bryan Vernanda on 16/10/24.
//

import SwiftUI

struct HanvestSelectableOptionsView: View {
    // Constants
    let headerText: String
    
    // Component Contents
    var image: Image?
    var choicesText: [String]?
    var choicesColor: [HanvestModule02ColorOptions]?
    var eachComponentSpacing: CGFloat?
    var textAndImageSpacing: CGFloat?
    var onSelectAnswer: (String) -> Void
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: (eachComponentSpacing) != nil ? eachComponentSpacing : 0) {
            VStack(spacing: (textAndImageSpacing) != nil ? textAndImageSpacing : 0) {
                Text(headerText)
                    .font(.nunito(.title2))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                if let image = image {
                    image
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            
            if let choicesText = choicesText {
                ForEach(choicesText, id: \.self) { choice in
                    HanvestButtonRadioBehavior(
                        style: .bordered(isDisabled: false),
                        selectedButtonID: $selectedButtonID,
                        title: choice,
                        action: {
                            onSelectAnswer(choice)
                        }
                    )
                    .font(.nunito(.body))
                    .frame(maxWidth: .infinity)
                }
            }
            
            if let choicesColor = choicesColor {
                HStack(spacing: 24) {
                    ForEach(choicesColor, id: \.self) { choice in
                        HanvestColorPickerRadioButton(
                            radioButtonColor: choice.colorOptions,
                            selectedButtonID: $selectedButtonID,
                            action: {
                                onSelectAnswer(choice.colorDescription)
                            }
                        )
                    }
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    // First case
    @Previewable let question: String = "How will you handle a 15% loss on your investment?"
    @Previewable let answers: [String] = ["Option One", "Option Two", "Option Three"]
    
    // Second case
    @Previewable let headerText: String = "There’s a brand new iphone just\nreleased"
    @Previewable let image: Image? = Image("iphone-pic-01")
    
    // Third case
    @Previewable let choicesColor = HanvestModule02ColorOptions.allCases
    
    // First case
//    HanvestSelectableOptionsView(
//        headerText: question,
//        choicesText: answers,
//        eachComponentSpacing: 24,
//        onSelectAnswer: {_ in}
//    )
    
    // Second case
//    HanvestSelectableOptionsView(
//        headerText: headerText,
//        image: image,
//        textAndImageSpacing: 65,
//        onSelectAnswer: {_ in}
//    )
    
    // Third case
    HanvestSelectableOptionsView(
        headerText: headerText,
        image: image,
        choicesColor: choicesColor,
        eachComponentSpacing: 40,
        textAndImageSpacing: 98,
        onSelectAnswer: {_ in}
    )

}


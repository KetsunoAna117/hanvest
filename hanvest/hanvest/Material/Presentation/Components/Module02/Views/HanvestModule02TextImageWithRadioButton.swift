//
//  HanvestTextImageWithRadioButton.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct HanvestTextImageWithRadioButton: View {
    // Constants
    let headerText: String
    private let colorOptions = HanvestModule02ColorOptions.allCases
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        VStack(spacing: 40) {
            HanvestTextWithImageView(
                headerText: headerText,
                image: Image("iphone-pic-01"),
                textAndImageSpacing: 98
            )
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 24) {
                ForEach(colorOptions, id: \.self) { option in
                    HanvestColorPickerRadioButton(
                        radioButtonColor: option.colorOptions,
                        selectedButtonID: $selectedButtonID
                    )
                }
            }
            .padding(.horizontal, 40)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HanvestTextImageWithRadioButton(
        headerText: "Now choose the color you want"
    )
}

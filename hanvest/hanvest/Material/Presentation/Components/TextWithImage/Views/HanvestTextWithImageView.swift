//
//  TextWithImageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct HanvestTextWithImageView: View {
    // Constants
    let headerText: String
    let image: Image
    let textAndImageSpacing: CGFloat
    
    var body: some View {
        ZStack {
            VStack(spacing: textAndImageSpacing) {
                Text(headerText)
                    .font(.nunito(.title2))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                
                image
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestTextWithImageView(
        headerText: "There’s a brand new iphone just released",
        image: Image("iphone-pic-01"),
        textAndImageSpacing: 65
    )
}

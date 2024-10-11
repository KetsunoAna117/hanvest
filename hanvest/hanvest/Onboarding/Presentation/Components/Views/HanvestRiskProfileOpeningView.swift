//
//  RiskProfileTextView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileOpeningView: View {
    // Constants
    let image: Image
    let headerText: String
    let detailText: String
    
//    @State var state: RiskProfilePageState = .openingPage
    
    var body: some View {
        ZStack {
            VStack(spacing: 104) {
                VStack(spacing: 8) {
                    Text("\(headerText)")
                        .font(.nunito(.title1, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("\(detailText)")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    // TODO: replace the rectangle with logo
                    Rectangle()
                        .frame(maxWidth: 180, maxHeight: 180)
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 37)
    }
}

#Preview {
    HanvestRiskProfileOpeningView(
        image:
            Image(systemName: "checkmark"),
        headerText:
            "Welcome to Hanvesting",
        detailText:
            "Ready to level up?\nFill in your risk profile\nto personalize your learning path"
    )
}

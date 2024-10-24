//
//  RiskProfileTextView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileOpeningView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 104) {
                VStack(spacing: 8) {
                    Text("Welcome to Hanvesting")
                        .font(.nunito(.title1, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("Ready to level up?\nFill in your risk profile\nto personalize your learning path")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                
                // TODO: replace the rectangle with logo image
                Rectangle()
                    .frame(maxWidth: 180, maxHeight: 180)
                    .cornerRadius(12)
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 37)
    }
}

#Preview {
    HanvestRiskProfileOpeningView()
}

//
//  RiskProfileQuestionView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileQuestionView: View {
    // Constants
    let image: Image
    let riskStringValue: String
    let riskDescription: String
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Text("Your risk profile is")
                    .font(.nunito(.title2, .bold))
                    .frame(maxWidth: .infinity)
                
                // TODO: replace the rectangle with image
                Rectangle()
                    .frame(maxWidth: 117.5, maxHeight: 138)
                    .cornerRadius(12)
                
                VStack(spacing: 18) {
                    Text("\(riskStringValue)")
                        .font(.nunito(.largeTitle, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("\(riskDescription)")
                        .font(.nunito(.body))
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestRiskProfileQuestionView(
        image:
            Image(systemName: "checkmark"),
        riskStringValue:
            "Conservative",
        riskDescription:
            "Prefers low-risk investments with stable returns. Focuses on capital preservation over growth, such as bonds or savings accounts."
    )
}

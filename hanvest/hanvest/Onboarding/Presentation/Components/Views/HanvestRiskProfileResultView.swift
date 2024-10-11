//
//  RiskProfileQuestionView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileResultView: View {
    // Constants
    let image: Image
    let riskHeaderText: String
    let riskDetailText: String
    
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
                    Text("\(riskHeaderText)")
                        .font(.nunito(.largeTitle, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("\(riskDetailText)")
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
    HanvestRiskProfileResultView(
        image:
            Image(systemName: "checkmark"),
        riskHeaderText:
            "Conservative",
        riskDetailText:
            "Prefers low-risk investments with stable returns. Focuses on capital preservation over growth, such as bonds or savings accounts."
    )
}

//
//  RiskProfileQuestionView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct HanvestRiskProfileResultView: View {
    // Constants
    let resultState: RiskProfileResultState
    
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
                    Text("\(resultState.riskHeaderText)")
                        .font(.nunito(.largeTitle, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Text("\(resultState.riskDetailText)")
                        .font(.nunito(.body))
                        .frame(maxWidth: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestRiskProfileResultView(
        resultState: .conservative
    )
}

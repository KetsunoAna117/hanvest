//
//  HanvestHeaderWithDetailTextDefaultView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestHeaderWithDetailTextView: View {
    // Constants
    let spacingBetweenHeaderAndDetail: CGFloat
    let headerText: Text
    let detailText: Text
    
    var body: some View {
        ZStack {
            VStack(spacing: spacingBetweenHeaderAndDetail) {
                headerText
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                detailText
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestHeaderWithDetailTextView(
        spacingBetweenHeaderAndDetail: 24,
        headerText:
            Text("In summary\n").font(.nunito(.title2, .bold)) +
            Text("Liabilities vs Assets").font(.nunito(.title2)),
        detailText:
            Text(
                "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities). Having a healthy balance sheet, where assets exceed liabilities, is one of the foundations of financial success.\n\n"
            ).font(.nunito(.subhead)) +
            Text(
                "Reference"
            ).font(.nunito(.subhead, .bold)) +
            Text(
                ": Ross, S. A., Westerfield, R. W., & Jaffe, J. (2013). Corporate Finance. McGraw-Hill Education."
            ).font(.nunito(.subhead))
    )
}

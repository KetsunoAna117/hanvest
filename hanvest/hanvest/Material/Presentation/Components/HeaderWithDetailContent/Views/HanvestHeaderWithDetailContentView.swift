//
//  HanvestHeaderWithDetailTextDefaultView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestHeaderWithDetailContent: View {
    // Constants
    let headerText: Text
    let detailText: Text
    
    // Component Contents
    var image: Image?
    var customSpacing: CGFloat?
    var choicesText: [String]?
    var productStage: Int?
    var onSelectAnswer: ((String) -> Void)? = nil
    
    @State private var selectedButtonID = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                VStack(spacing: (customSpacing != nil) ? customSpacing : 24) {
                    headerText
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                    }
                    
                    detailText
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
                
                if let choicesText = choicesText {
                    ForEach(choicesText, id: \.self) { choice in
                        HanvestButtonRadioBehavior(
                            style: .bordered(isDisabled: false),
                            selectedButtonID: $selectedButtonID,
                            title: choice,
                            action: {
                                if let onSelectAnswer = onSelectAnswer {
                                    onSelectAnswer(choice)
                                }
                            }
                        )
                        .font(.nunito(.body))
                        .frame(maxWidth: .infinity)
                    }
                }
                
                if let productStage = productStage {
                    ScrollView(.vertical) {
                        VStack(spacing: 24) {
                            ForEach(Module03ProductOfInvestmentEntity.getMockData()[productStage].indices, id: \.self) { productID in
                                HanvestProductOfInvestmentTable(
                                    productStage: productStage,
                                    productID: productID
                                )
                            }
                        }
                        .frame(maxWidth: 353)
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HanvestHeaderWithDetailContent(
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

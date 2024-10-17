//
//  HanvestModule03ProductOfInvestment.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct HanvestProductOfInvestmentTable: View {
    // Constants
    let productTitle: String
    let productDetail: String
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 8) {
                    VStack(spacing: 4) {
                        Text(productTitle)
                            .font(.nunito(.subhead, .bold))
                            .frame(maxWidth: .infinity)
                        Text(productDetail)
                            .font(.nunito(.caption2))
                    }
                }
                .padding(.vertical, 8)
                .completionCardStyle()
            
//                HanvestModule03ProductOfInvestmentChart(viewmodel: <#HanvestModule03ProductOfInvestmentViewModel#>, symbolCategoryKeyPath: <#KeyPath<Module03ProductOfInvestmentPriceEntity, String>#>)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    @Previewable let productTitle = "Deposito"
    @Previewable let productDetail = "Rp 10.010.000 +0.1%"
    
    HanvestProductOfInvestmentTable(
        productTitle: productTitle,
        productDetail: productDetail
    )
}

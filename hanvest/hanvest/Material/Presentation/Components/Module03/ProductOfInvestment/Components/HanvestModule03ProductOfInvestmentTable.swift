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
    let productImageChart: Image
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @Previewable let productTitle = "Deposito"
    @Previewable let productDetail = "Rp 10.010.000 +0.1% "
    @Previewable let productImageChart = Image("deposito-chart-01")
    
    HanvestProductOfInvestmentTable(
        productTitle: productTitle,
        productDetail: productDetail,
        productImageChart: productImageChart
    )
}

//
//  StockHeaderInformationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct StockHeaderInformationView: View {
    var stockCodeName: String
    var stockNameDescription: String
    
    @Binding var currentStockPrice: Int
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    StockHeaderInformationView()
}

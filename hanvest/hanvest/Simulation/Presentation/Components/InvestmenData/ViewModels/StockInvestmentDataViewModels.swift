//
//  StockInvestmentDataViewModels.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation
import SwiftUI

class StockInvestmentDataViewModels: ObservableObject {
    @Published var profitLossLabel: Int = 0
    @Published var profitLossPercentageLabel: Int = 0
    
    func calculateProfitLoss(userInvestment: Binding<Int>, totalEquity: Binding<Int>) {
        profitLossLabel = userInvestment.wrappedValue - totalEquity.wrappedValue
        
    }
    
}

//
//  StockInvestmentDataViewModels.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation
import SwiftUI

class StockInvestmentDataViewModels: ObservableObject {
    @Inject var getUserData: GetUserData
    @Inject var getUserTransaction: GetUserTransaction
    
    @Published var profitLossLabel: Int
    @Published var profitLossPercentageLabel: Int
    
    @Published var userLotOwned: Int
    @Published var userStockInvestment: Int
    @Published var userTotalEquity: Int
    
    init(){
        profitLossLabel = 0
        profitLossPercentageLabel = 0
        userLotOwned = 0
        userStockInvestment = 0
        userTotalEquity = 0
    }
    
    func setup(
        selectedStockIDName: String,
        stockPrice: Int
    ){
        setupTotalInvestment(selectedStockIDName: selectedStockIDName)
        userTotalEquity = stockPrice * userLotOwned
    }
    
    func calculateProfitLoss(userInvestment: Binding<Int>, totalEquity: Binding<Int>) {
        profitLossLabel = userInvestment.wrappedValue - totalEquity.wrappedValue
        
    }

    private func setupTotalInvestment(selectedStockIDName: String){
        let userTransaction = getUserTransaction.execute(stockIDName: selectedStockIDName)
        for transaction in userTransaction {
            userLotOwned += transaction.stockLotQuantity
            userStockInvestment += transaction.priceAtPurchase * transaction.stockLotQuantity
        }
    }
    

    
}

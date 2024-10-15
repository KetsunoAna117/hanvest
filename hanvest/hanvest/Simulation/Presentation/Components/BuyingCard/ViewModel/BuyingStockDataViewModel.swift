//
//  BuyingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

class BuyingStockDataViewModel: ObservableObject{
    @Published var tradingBalance: Int
    @Published var stockPrice: Int{
        didSet {
            calculateStockBuyAmount()
        }
    }
    @Published var stockBuyLot: Int{
        didSet {
            calculateStockBuyAmount()
        }
    }
    @Published var stockBuyAmount: Int = 0
    
    init(tradingBalance: Int, stockPrice: Int, stockBuyLot: Int = 0) {
        self.tradingBalance = tradingBalance
        self.stockPrice = stockPrice
        self.stockBuyLot = stockBuyLot
    }
    
    func calculateStockBuyAmount(){
        stockBuyAmount = stockPrice * stockBuyLot * 100
    }
    
    func maximumStockBuyLot() -> Int {
        let maxLot = tradingBalance / (stockPrice * 100)
        return maxLot
    }
    
    func calculateStockBuyAmountPercentage() -> String {
        let percentage = Double(stockBuyAmount) / Double(tradingBalance) * 100
        return String(format: "%.2f", percentage)
    }
    
    func maximumStockBuyAmount() -> Int {
        
        stockBuyAmount
    }
}


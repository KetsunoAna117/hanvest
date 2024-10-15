//
//  BuyingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

class BuyingStockDataViewModel: ObservableObject{
    @Published var tradingBalance: Int {
        didSet {
            validateStockBuyAmount()
        }
    }
    @Published var stockPrice: Int{
        didSet {
            validateStockBuyAmount()
        }
    }
    @Published var stockBuyLot: Int{
        didSet {
            validateStockBuyAmount()
        }
    }
    @Published var stockBuyAmount: Int = 0
    
    init() {
        self.tradingBalance = 0
        self.stockPrice = 0
        self.stockBuyLot = 0
        
    }
    
    func setup(tradingBalance: Int, stockPrice: Int, stockBuyLot: Int = 25){
        self.tradingBalance = tradingBalance
        self.stockPrice = stockPrice
        self.stockBuyLot = stockBuyLot
        validateStockBuyAmount()
    }
    
    func validateStockBuyAmount() {
        validateStockPrice()
        validateStockBuyLot()
        calculateStockBuyAmount()
    }
    
    func calculateStockBuyAmount(){
        stockBuyAmount = stockPrice * stockBuyLot * 100
    }
    
    private func validateStockPrice() {
            if stockPrice < 0 {
                stockPrice = 0
            }
        }
    
    private func validateStockBuyLot() {
        let maxLot = maximumStockBuyLot()
            if stockBuyLot < 0 {
                stockBuyLot = 0
            } else if stockBuyLot > maxLot {
                stockBuyLot = maxLot
            }
        }

    
    func maximumStockBuyLot() -> Int {
        guard stockPrice > 0 else { return 0 }
        let maxLot = tradingBalance / (stockPrice * 100)
        return maxLot
    }
    
    func calculateStockBuyAmountPercentage() -> String {
        let percentage = Double(stockBuyAmount) / Double(tradingBalance) * 100
        return String(format: "%.2f", percentage)
    }
}


//
//  BuyingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 14/10/24.
//

import SwiftUI

class BuyingStockDataViewModel: ObservableObject{
    // Dependency Injection
    @Inject var getUserData: GetUserData
    
    // Variables
    @Published var tradingBalance: Int {
        didSet {
            validateStockBuyAmount()
        }
    }
    @Published var toBuyStockPrice: Int {
        didSet {
            validateStockBuyAmount()
        }
    }
    @Published var stockBuyLot: Int {
        didSet {
            print()
            validateStockBuyAmount()
        }
    }
    @Published var stockBuyAmount: Int
    @Published var initialStockPrice: Int
    @Published var currentStockPrice: Int
    
    init() {
        self.tradingBalance = 0
        self.toBuyStockPrice = 0
        self.stockBuyLot = 0
        self.stockBuyAmount = 0
        self.initialStockPrice = 0
        self.currentStockPrice = 0
    }
    
    func setup(
        stockBuyLot: Int = 0,
        initialStockPrice: Int,
        currentStockPrice: Int
    ){
        self.tradingBalance = getUserData.execute().userBalance
        self.toBuyStockPrice = currentStockPrice
        self.stockBuyLot = stockBuyLot
        
        self.initialStockPrice = initialStockPrice
        self.currentStockPrice = currentStockPrice
        validateStockBuyAmount()
    }
    
    func validateStockBuyAmount() {
        validateStockPrice()
        validateStockBuyLot()
        calculateStockBuyAmount()
    }
    
    func calculateStockBuyAmount(){
        stockBuyAmount = toBuyStockPrice * stockBuyLot * 100
    }
    
    private func validateStockPrice() {
        if toBuyStockPrice < 0 {
            toBuyStockPrice = 0
        }
    }
    
    private func validateStockBuyLot() {
        if stockBuyLot < 0 {
            stockBuyLot = 0
        }
    }
    
    func maximumStockBuyLot() -> Int {
        guard toBuyStockPrice > 0 else { return 0 }
        let maxLot = tradingBalance / (toBuyStockPrice * 100)
        return maxLot
    }
    
    func calculateStockBuyAmountPercentage() -> String {
        let percentage = Double(stockBuyAmount) / Double(tradingBalance) * 100
        return String(format: "%.2f", percentage)
    }
    
    func determineAmountState() -> HanvestBuyingCardDefaultState{
        if stockBuyAmount <= tradingBalance {
            return .Affordable
        } else {
            return .Exceeded
        }
    }
}


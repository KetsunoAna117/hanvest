//
//  SellingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

class SellingStockDataViewModel: ObservableObject{
    // Dependency Injection
    @Inject var getUserData: GetUserData
    
    @Published var availableLot: Int {
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var currentStockPrice: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var stockSellLot: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    
    @Published var stockSellAmount: Int
    
    init() {
        self.availableLot = 0
        self.currentStockPrice = 0
        self.stockSellLot = 0
        self.stockSellAmount = 0
    }
    
    func setup(
        stockSellLot: Int = 0,
        currentStockPrice: Int
    ){
        self.availableLot = getUserData.execute().userLotOwned
        self.currentStockPrice = currentStockPrice
        self.stockSellLot = stockSellLot
        validateStockSellAmount()
    }
    
    func validateStockSellAmount() {
        validateStockPrice()
        validateStockSellLot()
        calculateStockSellAmount()
    }
    
    func calculateStockSellAmount(){
        stockSellAmount = currentStockPrice * stockSellLot * 100
    }
    
    private func validateStockPrice() {
        if currentStockPrice < 0 {
            currentStockPrice = 0
        }
    }
    
    private func validateStockSellLot() {
        if stockSellLot < 0 {
            stockSellLot = 0
        }
    }
    
    func maximumStockSellLot() -> Int {
        let maxLot = availableLot
        return maxLot
    }
    
    func calculateStockSellAmountPercentage() -> String {
        let percentage = Double(stockSellLot) / Double(availableLot) * 100
        return String(format: "%.2f", percentage)
    }
    
    func determineAmountState() -> HanvestSellingCardDefaultState{
        if stockSellLot <= availableLot {
            return .Affordable
        } else {
            return .Exceeded
        }
    }
    
}


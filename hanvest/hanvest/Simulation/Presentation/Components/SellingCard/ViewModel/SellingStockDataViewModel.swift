//
//  SellingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

class SellingStockDataViewModel: ObservableObject{
    // Dependency Injection
    @Inject var calculateOwnedLot: FilterTransactionByStockIDName
    
    var selectedStockIDName: String
    var stockSellFee: Int
    
    @Published var availableLot: Int {
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var toSellStockPrice: Int{
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
    @Published var initialStockPrice: Int
    @Published var currentStockPrice: Int
    
    init() {
        self.selectedStockIDName = ""
        self.stockSellFee = 500
        self.availableLot = 0
        self.toSellStockPrice = 0
        self.stockSellLot = 0
        self.stockSellAmount = 0
        self.initialStockPrice = 0
        self.currentStockPrice = 0
    }
    
    func setup(
        user: UserDataEntity?,
        selectedStockIDName: String,
        stockSellLot: Int = 0,
        initialStockPrice: Int,
        currentStockPrice: Int
    ){
        if let user = user {
            self.availableLot = calculateOwnedLot(selectedStockIDName: selectedStockIDName, user: user)
        }
        
        self.selectedStockIDName = selectedStockIDName
        self.toSellStockPrice = currentStockPrice
        self.stockSellLot = stockSellLot
        
        self.initialStockPrice = initialStockPrice
        self.currentStockPrice = currentStockPrice
        validateStockSellAmount()
    }
    
    private func calculateOwnedLot(selectedStockIDName: String, user: UserDataEntity) -> Int {
        var lotCount = 0
        let purchasedLot = calculateOwnedLot.execute(stockIDName: selectedStockIDName, user: user)
        
        for data in purchasedLot {
            lotCount += data.stockLotQuantity
        }
        
        return lotCount
    }
    
    func validateStockSellAmount() {
        validateStockPrice()
        validateStockSellLot()
        calculateStockSellAmount()
    }
    
    func calculateStockSellAmount(){
        stockSellAmount = toSellStockPrice * stockSellLot * 100
    }
    
    private func validateStockPrice() {
        if toSellStockPrice < 0 {
            toSellStockPrice = 0
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
    
    func determineIsDisabledButtonState() -> Bool {
        if stockSellLot <= availableLot && stockSellAmount > 0 {
            return false
        } else {
            return true
        }
    }
    
}


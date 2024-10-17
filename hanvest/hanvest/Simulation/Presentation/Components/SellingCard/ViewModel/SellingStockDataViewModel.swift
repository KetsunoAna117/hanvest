//
//  SellingStockDataViewModel.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 15/10/24.
//

import SwiftUI

class SellingStockDataViewModel: ObservableObject{
    @Published var availableLot: Int {
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var stockPrice: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var stockSellLot: Int{
        didSet {
            validateStockSellAmount()
        }
    }
    @Published var stockSellAmount: Int = 0
    
    init() {
        self.availableLot = 0
        self.stockPrice = 0
        self.stockSellLot = 0
    }
    
    func setup(availableLot: Int, stockPrice: Int, stockSellLot: Int = 25){
        self.availableLot = availableLot
        self.stockPrice = stockPrice
        self.stockSellLot = stockSellLot
        validateStockSellAmount()
    }
    
    func validateStockSellAmount() {
        validateStockPrice()
        validateStockSellLot()
        calculateStockSellAmount()
    }
    
    func calculateStockSellAmount(){
        stockSellAmount = stockPrice * stockSellLot * 100
    }
    
    private func validateStockPrice() {
            if stockPrice < 0 {
                stockPrice = 0
            }
        }
    
    private func validateStockSellLot() {
        let maxLot = maximumStockSellLot()
            if stockSellLot < 0 {
                stockSellLot = 0
            } else if stockSellLot > maxLot {
                stockSellLot = maxLot
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
}


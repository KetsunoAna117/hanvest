//
//  Module05BuyingStockViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

class Module05BuyingStockViewModel: BuyingStockDataViewModel {
    func setup(
        tradingBalance: Int,
        selectedStockIDName: String,
        stockBuyLot: Int = 0,
        initialStockPrice: Int,
        currentStockPrice: Int
    ){
        self.tradingBalance = tradingBalance
        
        self.selectedStockIDName = selectedStockIDName
        self.toBuyStockPrice = currentStockPrice
        self.stockBuyLot = stockBuyLot
        
        self.initialStockPrice = initialStockPrice
        self.currentStockPrice = currentStockPrice
        validateStockBuyAmount()
    }
}

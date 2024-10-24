//
//  Module05SellingStockViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//


class Module05SellingStockViewModel: SellingStockDataViewModel {
    override func setup(
        selectedStockIDName: String,
        stockSellLot: Int = 0,
        initialStockPrice: Int,
        currentStockPrice: Int
    ){
        self.selectedStockIDName = selectedStockIDName
        self.availableLot = calculateOwnedLot(selectedStockIDName: selectedStockIDName)
        self.toSellStockPrice = currentStockPrice
        self.stockSellLot = stockSellLot
        
        self.initialStockPrice = initialStockPrice
        self.currentStockPrice = currentStockPrice
        validateStockSellAmount()
    }
    
    private func calculateOwnedLot(selectedStockIDName: String) -> Int {
        var lotCount = 0
        let purchasedLot = getPurchasedLot.execute(stockIDName: selectedStockIDName)
        
        for data in purchasedLot {
            lotCount += data.stockLotQuantity
        }
        
        return lotCount
    }
}

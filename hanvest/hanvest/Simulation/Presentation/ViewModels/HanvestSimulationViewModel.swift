//
//  HanvestSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

class HanvestSimulationViewModel: ObservableObject {
    @Inject var getStockList: GetAvailableSimulationStocks
    
    @Published var stockList: [SimulationStockEntity] = []
    @Published var selectedStockID: String = "" {
        didSet {
            updateSelectedStock()
        }
    }
    @Published var selectedStock: SimulationStockEntity?
    
    init(){
        stockList = getStockList.execute()
        if let firstStock = stockList.first {
            self.selectedStock = firstStock
            self.selectedStockID = firstStock.stockIDName
        }
    }
    
    func setupSelectedStockOnAppear(){
        self.selectedStock = stockList.first
    }
    
    private func updateSelectedStock() {
        if let stock = stockList.first(where: { $0.stockIDName == selectedStockID }) {
            self.selectedStock = stock
        } else {
            print("Error: Stock with ID \(selectedStockID) not found.")
            self.selectedStock = nil
        }
    }
}


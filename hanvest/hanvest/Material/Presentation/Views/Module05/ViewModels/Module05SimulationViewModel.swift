//
//  Module05SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class Module05SimulationViewModel: HanvestSimulatable {
    var stockList: [SimulationStockEntity]
    
    var selectedStockID: String
    
    var selectedStock: SimulationStockEntity?
    
    var displayActiveStockInitialPrice: Int
    
    var displayActiveStockCurrentPrice: Int
    
    init(){
        stockList = []
        selectedStockID = ""
        displayActiveStockInitialPrice = 0
        displayActiveStockCurrentPrice = 0
    }
    
    func setup() {
        
    }
    
    func updateSelectedStock() {
        
    }
    
    
}

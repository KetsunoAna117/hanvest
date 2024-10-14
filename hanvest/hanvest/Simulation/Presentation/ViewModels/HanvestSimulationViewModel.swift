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
    @Published var selectedStock: SimulationStockEntity?
    
    init(){
        stockList = getStockList.execute()
    }
}


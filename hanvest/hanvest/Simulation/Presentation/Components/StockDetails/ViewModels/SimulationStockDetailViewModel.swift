//
//  SimulationStockDetailViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import Foundation

class SimulationStockDetailViewModel: ObservableObject {
    @Inject var getSimulationStockByID: GetStockInformationByID
    
    @Published var initialPrice: Int = 0
    @Published var currentPrice: Int = 0
    
    init(){
        let fetchedStock = getSimulationStockByID.execute(id: "BBRI")
        initialPrice = fetchedStock.stockPrice.first?.price ?? 0
        currentPrice = fetchedStock.stockPrice.last?.price ?? 0
    }
}

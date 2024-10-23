//
//  Module05SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class Module05SimulationViewModel: HanvestSimulationViewModel {
    @Inject var getModule05StockData: GetModule05StockData
    
    override func setup(){
        self.stockList = getModule05StockData.execute()
    }
    
}

extension Module05SimulationViewModel {
    
}

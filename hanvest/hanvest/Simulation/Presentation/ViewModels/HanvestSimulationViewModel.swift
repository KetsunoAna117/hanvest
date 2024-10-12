//
//  HanvestSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

@Observable class HanvestSimulationViewModel {
    var stockList: [SimulationStockEntity]
    
    init(){
        stockList = []
    }
}


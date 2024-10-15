//
//  GetAvailableSimulationStocks.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

protocol GetAvailableSimulationStocks {
    func execute() -> [SimulationStockEntity]
}

struct GetAvailableSimulationStocksImpl: GetAvailableSimulationStocks {
    func execute() -> [SimulationStockEntity] {
        return SimulationStockEntity.getMockData()
    }
}

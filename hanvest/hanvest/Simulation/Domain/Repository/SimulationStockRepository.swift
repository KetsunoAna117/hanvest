//
//  SimulationStockRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol SimulationStockRepository {
    func fetch() -> [SimulationStockSchema]
    func fetch(id: String) -> SimulationStockSchema?
    func save(_ stocks: SimulationStockSchema)
    func delete(id: String)
    func update(stockIDName: String)
    func update(stockName: String)
    func update(stockImageName: String)
    func update(stockDescription: String)
    func update(stockPriceID: [String])
}

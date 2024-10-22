//
//  SimulationStockRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol SimulationStockRepository {
    func fetchAll() -> [SimulationStockSchema]
    func fetch(stockID: String) -> SimulationStockSchema?
    func save(_ stocks: SimulationStockSchema) throws
    func delete(id: String) throws
    func update(id: String, stockIDName: String) throws
    func update(id: String, stockName: String) throws
    func update(id: String, stockImageName: String) throws
    func update(id: String, stockDescription: String) throws
    func update(id: String, stockPriceID: [String]) throws
}

//
//  GetStockNewsData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

protocol GetStockNewsData {
    func execute() -> [SimulationNewsEntity]
}

struct GetStockDataImpl: GetStockNewsData {
    func execute() -> [SimulationNewsEntity] {
        return SimulationNewsEntity.mock()
    }
}

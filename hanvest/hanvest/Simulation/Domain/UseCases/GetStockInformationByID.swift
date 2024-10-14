//
//  GetStockInformationByID.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation

protocol GetStockInformationByID {
    func execute(id: String) -> SimulationStockEntity
}

struct GetStockInformationByIDImpl: GetStockInformationByID {
    func execute(id: String) -> SimulationStockEntity {
        return SimulationStockEntity.getMockData().first!
    }
}

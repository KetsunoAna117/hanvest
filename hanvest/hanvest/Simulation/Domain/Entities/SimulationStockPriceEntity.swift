//
//  SimulationStockPriceEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

struct SimulationStockPriceEntity: Equatable {
    var id: String = UUID().uuidString
    var stockIDName: String
    var stockPrice: Int
    var time: Date
    
    static func == (lhs: SimulationStockPriceEntity, rhs: SimulationStockPriceEntity) -> Bool {
        return
            lhs.stockPrice == rhs.stockPrice &&
            lhs.time == rhs.time
    }
}

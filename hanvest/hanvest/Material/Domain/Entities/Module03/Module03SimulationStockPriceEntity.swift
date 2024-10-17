//
//  Module03SimulationStockPriceEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

struct Module03SimulationStockPriceEntity: Equatable {
    var id: String = UUID().uuidString
    var stockIDName: String
    var stockPrice: Int
    var time: Date
    
    static func == (lhs: Module03SimulationStockPriceEntity, rhs: Module03SimulationStockPriceEntity) -> Bool {
        return
            lhs.stockPrice == rhs.stockPrice &&
            lhs.time == rhs.time
    }
}

//
//  SimulationStockEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

struct SimulationStockEntity {
    var stockIDName: String
    var stockName: String
    var stockImageName: String
    
    var stockDescription: String
    
    var stockPrice: [SimulationStockPriceEntity]
}

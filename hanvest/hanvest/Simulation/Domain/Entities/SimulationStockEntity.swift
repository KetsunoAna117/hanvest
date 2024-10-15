//
//  SimulationStockEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation
import SwiftUI

struct SimulationStockEntity: Equatable {
    var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockImageColor: Color
    
    var stockDescription: String
    
    var stockPrice: [SimulationStockPriceEntity]
    
    static func == (lhs: SimulationStockEntity, rhs: SimulationStockEntity) -> Bool {
        return
            lhs.stockIDName == rhs.stockIDName &&
            lhs.stockName == rhs.stockName &&
            lhs.stockImageName == rhs.stockImageName &&
            lhs.stockImageColor == rhs.stockImageColor &&
            lhs.stockDescription == rhs.stockDescription &&
            lhs.stockPrice == rhs.stockPrice
    }
    
    
    static func getMockData() -> [SimulationStockEntity] {
        return [
            SimulationStockEntity(
                stockIDName: "BBRI",
                stockName: "Pt. Bank Rakyat Indonesia Tbk.",
                stockImageName: "bri",
                stockImageColor: .blue,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 3000, time: HanvestDateFormatter.stringToDate("2024-10-11 15:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 15:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 16:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 16:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 17:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 2000, time: HanvestDateFormatter.stringToDate("2024-10-11 17:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 3000, time: HanvestDateFormatter.stringToDate("2024-10-11 18:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 18:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:00:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBRI", stockPrice: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 22:00:00"))
                ]
            ),
            SimulationStockEntity(
                stockIDName: "BBCA",
                stockName: "Pt. Bank Central Asia Tbk.",
                stockImageName: "bca",
                stockImageColor: .blue,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockIDName: "BBCA", stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 19:20:00")),
                    SimulationStockPriceEntity(stockIDName: "BBCA", stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    SimulationStockPriceEntity(stockIDName: "BBCA", stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 21:40:00")),
                    SimulationStockPriceEntity(stockIDName: "BBCA", stockPrice: 4500, time: HanvestDateFormatter.stringToDate("2024-10-11 22:50:00"))
                ]
            ),
            SimulationStockEntity(
                stockIDName: "GOTO",
                stockName: "Pt. GOTO Tbk.",
                stockImageName: "goto",
                stockImageColor: .green,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockIDName: "GOTO", stockPrice: 50, time: HanvestDateFormatter.stringToDate("2024-10-11 20:20:00")),
                    SimulationStockPriceEntity(stockIDName: "GOTO", stockPrice: 60, time: HanvestDateFormatter.stringToDate("2024-10-11 21:30:00")),
                    SimulationStockPriceEntity(stockIDName: "GOTO", stockPrice: 65, time: HanvestDateFormatter.stringToDate("2024-10-11 22:40:00")),
                    SimulationStockPriceEntity(stockIDName: "GOTO", stockPrice: 55, time: HanvestDateFormatter.stringToDate("2024-10-11 23:50:00"))
                ]
            )
        ]
    }
}

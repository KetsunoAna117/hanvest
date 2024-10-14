//
//  SimulationStockEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation
import SwiftUI

struct SimulationStockEntity {
    var stockIDName: String
    var stockName: String
    var stockImageName: String
    var stockImageColor: Color
    
    var stockDescription: String
    
    var stockPrice: [SimulationStockPriceEntity]
    
    
    static func getMockData() -> [SimulationStockEntity] {
        return [
            SimulationStockEntity(
                stockIDName: "BBRI",
                stockName: "Pt. Bank Rakyat Indonesia Tbk.",
                stockImageName: "bri",
                stockImageColor: .blue,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-10 20:23:00")),
                    SimulationStockPriceEntity(stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:33:00")),
                    SimulationStockPriceEntity(stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:43:00")),
                    SimulationStockPriceEntity(stockPrice: 7000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:53:00"))
                ]
            ),
            SimulationStockEntity(
                stockIDName: "BBCA",
                stockName: "Pt. Bank Central Asia Tbk.",
                stockImageName: "bca",
                stockImageColor: .blue,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-10 20:20:00")),
                    SimulationStockPriceEntity(stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    SimulationStockPriceEntity(stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:40:00")),
                    SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:50:00"))
                ]
            ),
            SimulationStockEntity(
                stockIDName: "GOTO",
                stockName: "Pt. GOTO Tbk.",
                stockImageName: "goto",
                stockImageColor: .green,
                stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
                stockPrice: [
                    SimulationStockPriceEntity(stockPrice: 50, time: HanvestDateFormatter.stringToDate("2024-10-10 20:20:00")),
                    SimulationStockPriceEntity(stockPrice: 60, time: HanvestDateFormatter.stringToDate("2024-10-11 20:30:00")),
                    SimulationStockPriceEntity(stockPrice: 55, time: HanvestDateFormatter.stringToDate("2024-10-11 20:40:00")),
                    SimulationStockPriceEntity(stockPrice: 50, time: HanvestDateFormatter.stringToDate("2024-10-11 20:50:00"))
                ]
            )
        ]
    }
}

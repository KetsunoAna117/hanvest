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
        return SimulationStockEntity(
            stockIDName: "BBRI",
            stockName: "Pt. Bank Rakyat Indonesia Tbk.",
            stockImageName: "bri",
            stockDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus tellus nulla, ut blandit neque rutrum in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec sem lectus, semper a libero ut, congue sodales sem. Ut convallis volutpat ipsum quis maximus.",
            stockPrice: [
                SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-10 20:23:00")),
                SimulationStockPriceEntity(stockPrice: 6000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:33:00")),
                SimulationStockPriceEntity(stockPrice: 4000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:43:00")),
                SimulationStockPriceEntity(stockPrice: 5000, time: HanvestDateFormatter.stringToDate("2024-10-11 20:53:00"))
            ]
        )
    }
}

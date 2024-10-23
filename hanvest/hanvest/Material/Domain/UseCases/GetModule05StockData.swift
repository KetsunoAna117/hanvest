//
//  GetModule05StockData.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

protocol GetModule05StockData {
    func execute() -> [SimulationStockEntity]
}

struct GetModule05StockDataImpl: GetModule05StockData {
    func execute() -> [SimulationStockEntity] {
        return [
            .init(
                stockIDName: "BBCA",
                stockName: "PT Bank Central Asia Tbk",
                stockImageName: "BBCA-logo",
                stockDescription: """
                                   PT Bank Central Asia Tbk, commonly known as Bank Central Asia (BCA) is an Indonesian bank founded on 21 February 1957. It is the largest private bank in Indonesia with assets amounting to Rp 5.529,83 trillion (USD 308,5 billion) as of 2022.[2] It is headquarters at BCA Tower in Jakarta.
                                   
                                   Bank Central Asia (BCA) was founded by Salim Group as “NV Perseroan Dagang Dan Industrie Semarang Knitting Factory". Originally the bank started small however it was expanded by banker and conglomerate Mochtar Riady who took control of the bank.[3] Bank Central Asia expanded rapidly during the 1980s and 90s, BCA works with well-known institutions, such as PT Telkom, Citibank, and American Express. The bank was hit hard during the 1997 financial crisis and the subsequent 1998 May Riot. It was in massive debt and as a result it was taken over by the Indonesian Bank Restructuring Agency and sold to another conglomerate group Djarum.[4]
                                   
                                   Since then BCA has thrived and subsequently, BCA took a major step by going public in the 2000. In 2022, Bank Central Asia was awarded to be the "Best Bank in Indonesia" by Forbes
                                   """,
                stockPrice: [
                    .init(
                        id: "transaction-01",
                        name: "BBCA",
                        price: 1500,
                        time: Date.init(timeIntervalSinceNow: -60 * 60 * 4)
                    ),
                    .init(
                        id: "transaction-01",
                        name: "BBCA",
                        price: 1520,
                        time: Date.init(timeIntervalSinceNow: -60 * 60 * 3)
                    ),
                    .init(
                        id: "transaction-01",
                        name: "BBCA",
                        price: 1510,
                        time: Date.init(timeIntervalSinceNow: -60 * 60 * 2)
                    )
                ]
            )
        ]
    }
}

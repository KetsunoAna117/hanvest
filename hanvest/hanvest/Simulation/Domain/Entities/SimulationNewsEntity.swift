//
//  SimulationNewsEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

struct SimulationNewsEntity {
    var newsID: String
    var stockIDName: String
    var newsTitle: String
    var newsReleasedTime: Date
    var newsContent: String
    var stockFluksPercentage: Int
}

extension SimulationNewsEntity {
    func mapToSchema() -> SimulationNewsSchema {
        return SimulationNewsSchema(
            newsID: self.newsID,
            stockIDName: self.stockIDName,
            newsTitle: self.newsTitle,
            newsReleasedTime: self.newsReleasedTime,
            newsContent: self.newsContent,
            stockFluksPercentage: self.stockFluksPercentage
        )
    }
}

extension SimulationNewsEntity {
    static func mock() -> [SimulationNewsEntity] {
        return [
            SimulationNewsEntity(
                newsID: UUID().uuidString,
                stockIDName: "GOTO",
                newsTitle: "GOTO gets billions in funding",
                newsReleasedTime: Date(timeInterval: -10, since: Date.now),
                newsContent:
                """
                In a recent report released today, Chinese tech giant Alibaba is said to have injected billions of rupiah into Gojek Tokopedia (GOTO). This investment is seen as part of Alibaba’s strategy to expand its business reach in Southeast Asia, particularly in Indonesia.

                Alibaba's move is viewed as an effort to strengthen GOTO’s ecosystem, which spans e-commerce, on-demand services, including transportation, food delivery, and online shopping platforms that are increasingly dominating the domestic market.

                The Chinese company is no stranger to Southeast Asia, having previously made significant investments in Lazada. With this new capital infusion, GOTO is expected to accelerate its growth and better compete against other global tech giants.

                Neither GOTO nor Alibaba has provided an official comment on the report, but analysts predict that this investment will further solidify GOTO’s position as a key player in Indonesia’s digital economy.

                """,
                stockFluksPercentage: 10
            ),
            SimulationNewsEntity(
                newsID: UUID().uuidString,
                stockIDName: "BBRI",
                newsTitle: "BBRI got positive revenue",
                newsReleasedTime: Date(timeInterval: -3 * 60 * 60 * 24, since: Date.now),
                newsContent:
                """
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fermentum nunc ac purus rutrum mollis. Proin in luctus velit. Morbi mollis mollis enim quis blandit. Donec sollicitudin nunc dui. Integer rhoncus lacus nec urna sagittis, eu facilisis lacus condimentum. Duis massa ex, volutpat ac ullamcorper quis, euismod id ex. Sed sit amet condimentum metus. Duis lobortis arcu ac justo dapibus viverra. Vestibulum sagittis ullamcorper metus, eu malesuada ligula laoreet vulputate. Nam convallis gravida auctor. Sed blandit arcu id luctus ullamcorper. Suspendisse vel feugiat dui. Aenean nec massa velit. Vestibulum ut ullamcorper purus. Fusce fermentum ipsum vitae quam tincidunt, a tincidunt dui ultricies.

                """,
                stockFluksPercentage: -5
            )
        ]
    }
}

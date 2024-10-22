//
//  SimulationNewsRepository.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 22/10/24.
//

import Foundation

protocol SimulationNewsRepository {
    func fetch() -> [SimulationNewsSchema]
    func fetch(id: String) -> SimulationNewsSchema?
    func save(_ news: SimulationNewsSchema)
    func delete(_ news: SimulationNewsSchema)
    func update(stockIDName: String)
    func update(newsTitle: String)
    func update(newsReleasedTime: Date)
    func update(newsContent: String)
    func update(stockFluksPercentage: Int)
}

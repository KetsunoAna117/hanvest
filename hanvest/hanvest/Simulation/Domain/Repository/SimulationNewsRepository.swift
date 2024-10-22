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
    func save(_ news: SimulationNewsSchema) throws
    func delete(id: String) throws
    func update(id: String, stockIDName: String) throws
    func update(id: String, newsTitle: String) throws
    func update(id: String, newsReleasedTime: Date) throws
    func update(id: String, newsContent: String) throws
    func update(id: String, stockFluksPercentage: Int) throws
}

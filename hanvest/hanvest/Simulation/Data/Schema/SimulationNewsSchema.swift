//
//  SimulationNewsSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class SimulationNewsSchema {
    var newsID: String
    var stockIDName: String
    var newsTitle: String
    var newsReleasedTime: Date
    var newsContent: String
    var stockFluksPercentage: Int
}

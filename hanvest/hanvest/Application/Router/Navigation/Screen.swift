//
//  Screen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import Foundation

enum Screen: Identifiable, Hashable, Equatable {
    case contentview
    case onboarding
    case simulationBuyingConfirmation(stock: SimulationStockEntity)
    case simulationSellingConfirmation(stock: SimulationStockEntity)
    case profile
    
    var id: Self { return self }
}

extension Screen {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .contentview:
            hasher.combine(self.hashValue)
        case .onboarding:
            hasher.combine(self.hashValue)
        case .simulationBuyingConfirmation:
            hasher.combine(self.hashValue)
        case .simulationSellingConfirmation:
            hasher.combine(self.hashValue)
        case .profile:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.contentview, .contentview),
            (.onboarding, .onboarding),
            (.simulationBuyingConfirmation, .simulationBuyingConfirmation),
            (.simulationSellingConfirmation, .simulationSellingConfirmation),
            (.profile, .profile):
            return true
        default:
            return false
        }
    }
}


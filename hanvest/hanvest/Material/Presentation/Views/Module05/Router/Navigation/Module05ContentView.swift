//
//  Module05.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

enum Module05ContentView: Identifiable, Hashable, Equatable {
    case buyStage(router: any AppRouterProtocol, viewModel: HanvestSimulationViewModel, buyAction: () -> ())
    case sellStage(router: any AppRouterProtocol, viewModel: HanvestSimulationViewModel, sellAction: () -> ())
    case confirmBuy(router: any AppRouterProtocol, viewModel: HanvestSimulationViewModel)
    case confirmSell(router: any AppRouterProtocol, viewModel: HanvestSimulationViewModel)
    case transactionStatus(router: any AppRouterProtocol, transaction: TransactionStatusViewModel)
    
    var id: Self { return self }
}

extension Module05ContentView {
    // Conform to Hashable
    func hash(into hasher: inout Hasher) {
        switch self {
        case .buyStage:
            hasher.combine(self.hashValue)
        case .sellStage:
            hasher.combine(self.hashValue)
        case .confirmBuy:
            hasher.combine(self.hashValue)
        case .confirmSell:
            hasher.combine(self.hashValue)
        case .transactionStatus:
            hasher.combine(self.hashValue)
        }
    }
    
    // Conform to Equatable
    static func == (lhs: Module05ContentView, rhs: Module05ContentView) -> Bool {
        switch (lhs, rhs) {
        case (.buyStage, .buyStage),
            (.sellStage, .sellStage),
            (.confirmBuy, .confirmBuy),
            (.confirmSell, .confirmSell),
            (.transactionStatus, .transactionStatus):
            return true
        default:
            return false
        }
    }
}

//
//  Module05ContentRouter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation
import SwiftUI

class Module05ContentRouter: Module05ContentRouterProtocol, ObservableObject {
    @Published var activeContent: Module05ContentView?
    
    @Published var currentProgress: Int = 0
    
    func push(_ content: Module05ContentView) {
        self.activeContent = content
        currentProgress += 1
    }
    
    func pop(){
        self.activeContent = nil
        currentProgress -= 1
    }
    
    @ViewBuilder
    func build(_ content: Module05ContentView) -> some View {
        switch content {
        case .buyStage(let appRouter, let viewModel, let buyAction):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationView(router: appRouter, viewmodel: viewModel, buyAction: buyAction, sellAction: nil)
            }
        case .sellStage(let appRouter, let viewModel, let sellAction):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSimulationView(router: appRouter, viewmodel: viewModel, buyAction: nil, sellAction: sellAction)
            }
        case .confirmBuy(let appRouter, let viewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestBuyStockScreenView(router: appRouter, simulationViewModel: viewModel)
            }
        case .confirmSell(let appRouter, let viewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSellStockScreenView(router: appRouter, simulationViewModel: viewModel)
            }
        case .transactionStatus(let appRouter, let transaction):
            ZStack {
                Color.background.ignoresSafeArea()
                TransactionStatusView(router: appRouter, transaction: transaction)
            }
        }
    }
    
}

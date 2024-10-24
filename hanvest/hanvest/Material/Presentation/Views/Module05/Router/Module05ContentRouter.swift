//
//  Module05ContentRouter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation
import SwiftUI

class Module05ContentRouter: Module05ContentRouterProtocol, ObservableObject {
    @Published var activeContent: [Module05ContentView] = []
    
    @Published var currentProgress: Int = 0
    
    func push(_ content: Module05ContentView) {
        self.activeContent.append(content)
        currentProgress += 1
    }
    
    func pop(){
        self.activeContent.removeLast()
        currentProgress -= 1
    }
    
    func popAll(){
        self.activeContent.removeAll()
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
        case .confirmBuy(let appRouter, let simulationViewmodel, let buyingViewModel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestBuyStockScreenView(
                    router: appRouter,
                    simulationViewModel: simulationViewmodel,
                    buyingViewmodel: buyingViewModel,
                    backAction: {
                        self.pop()
                    },
                    cancelAction: {
                        appRouter.dismissPopup()
                    },
                    confirmAction: { viewmodel in
                        self.push(
                            .transactionStatus(
                                router: appRouter,
                                transaction: TransactionStatusViewModel(
                                    lotAmount: viewmodel.stockBuyLot,
                                    stockPrice: viewmodel.toBuyStockPrice,
                                    selectedStockIDName: viewmodel.selectedStockIDName,
                                    transactionType: .buy
                                )
                            )
                        )
                    }
                )
            }
        case .confirmSell(let appRouter, let simulationViewModel, let sellingViewmodel):
            ZStack {
                Color.background.ignoresSafeArea()
                HanvestSellStockScreenView(
                    router: appRouter,
                    simulationViewModel: simulationViewModel,
                    sellingViewmodel: sellingViewmodel,
                    backAction: {
                        self.pop()
                    },
                    cancelAction: {
                        appRouter.dismissPopup()
                    },
                    confirmAction: { viewmodel in
                        self.push(
                            .transactionStatus(
                                router: appRouter,
                                transaction: TransactionStatusViewModel(
                                    lotAmount: viewmodel.stockSellLot,
                                    stockPrice: viewmodel.toSellStockPrice,
                                    selectedStockIDName: viewmodel.selectedStockIDName,
                                    transactionType: .sell
                                )
                            )
                        )
                    }
                )
            }
        case .transactionStatus(let appRouter, let transaction):
            ZStack {
                Color.background.ignoresSafeArea()
                TransactionStatusView(router: appRouter, transaction: transaction)
            }
        }
    }
    
}

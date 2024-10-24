//
//  HanvestSellStockView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 18/10/24.
//

import SwiftUI

struct HanvestSellStockScreenView: View {
    let router: any AppRouterProtocol
    
    var user: UserDataEntity?
    @ObservedObject var simulationViewModel: HanvestSimulationViewModel
    @ObservedObject var sellingViewmodel: SellingStockDataViewModel
    
    var backAction: () -> Void
    var cancelAction: () -> Void
    var confirmAction: (SellingStockDataViewModel) -> Void
    
    var body: some View {
        if let stock = simulationViewModel.selectedStock {
            VStack {
                HanvestNavigationBar(
                    label: "Sell \(stock.stockIDName)",
                    leadingIcon: Image(systemName: "chevron.left"),
                    leadingAction: {
                        backAction()
                    }
                )
                
                VStack(spacing: 24) {
                    StockHeaderInformationView(
                        stockCodeName: stock.stockIDName,
                        stockName: stock.stockName,
                        initialPrice: $simulationViewModel.displayActiveStockInitialPrice,
                        currentPrice: $simulationViewModel.displayActiveStockCurrentPrice
                    )
                    
                    SimulationSellingCard(viewModel: sellingViewmodel)
                }
                .padding(.horizontal, 20)
                .padding(.top, 24)
                
                Spacer()
                
                HanvestButtonDefault(
                    style: .filledCorrect(
                        isDisabled: sellingViewmodel.determineIsDisabledButtonState()
                    ),
                    title: "Sell",
                    action: {
                        router.presentOverlay(
                            .withSellConfirmationPopup(
                                viewmodel: sellingViewmodel,
                                confirmAction: {
                                    confirmAction(sellingViewmodel)
                                },
                                cancelAction: {
                                    cancelAction()
                                }
                            )
                        )
                        print("[!] User Sell Button Event Triggered!")
                    }
                )
                .padding(.bottom, 48)
            }
            .onAppear(){
                sellingViewmodel.setup(
                    user: user,
                    selectedStockIDName: stock.stockIDName,
                    initialStockPrice: stock.stockPrice.first?.price ?? 0,
                    currentStockPrice: stock.stockPrice.last?.price ?? 0
                )
            }
        }
    }
}

//#Preview {
//    @Previewable @StateObject var appRouter = AppRouter()
//    @Previewable @State var startScreen: Screen? =
//        .simulationSellingConfirmation
//    
//    NavigationStack(path: $appRouter.path) {
//        if let startScreen = startScreen {
//            appRouter.build(startScreen)
//                .navigationDestination(for: Screen.self) { screen in
//                    appRouter.build(screen)
//                }
//                .overlay {
//                    if let popup = appRouter.popup {
//                        ZStack {
//                            appRouter.build(popup)
//                        }
//                        
//                    }
//                }
//        }
//    }
//}

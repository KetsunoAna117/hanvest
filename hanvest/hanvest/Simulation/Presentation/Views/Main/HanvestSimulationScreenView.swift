//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    let router: any AppRouterProtocol
    @ObservedObject var viewmodel: HanvestSimulationViewModel
    
    let buyAction: (() -> ())?
    let sellAction: (() -> ())?
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HanvestStockOptionList(
                        selectedStockID: $viewmodel.selectedStockID,
                        simulationStockList: viewmodel.stockList,
                        onPressed: { data in
                            
                        }
                    )
                    
                    Divider()
                    
                    SimulationStockDetailsView(
                        router: router
                    )
                    .padding(.top, 12)
                    .environmentObject(viewmodel)
                    
                    Divider()
                        .padding(.top, -6)
                    
                    VStack {
                        HStack(spacing: 12) {
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledIncorrect(isDisabled: sellAction == nil ? true : false),
                                title: "Sell") {
                                    if let sellAction = sellAction {
                                        sellAction()
                                    }
                                }
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledCorrect(isDisabled: buyAction == nil ? true : false),
                                title: "Buy") {
                                    if let buyAction = buyAction {
                                        buyAction()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 13)
                    
                    Divider()
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .main
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}

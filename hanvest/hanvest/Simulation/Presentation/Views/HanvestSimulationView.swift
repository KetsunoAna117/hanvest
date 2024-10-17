//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    let router: any AppRouterProtocol
    @StateObject private var viewmodel = HanvestSimulationViewModel()
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Divider()
                    
                    HanvestStockOptionList(
                        selectedStockID: $viewmodel.selectedStockID,
                        simulationStockList: viewmodel.stockList
                    )
                    
                    Divider()
                    
                    SimulationStockDetailsView(
                        router: router,
                        selectedStock: $viewmodel.selectedStock
                    )
                    
                    Divider()
                    
                    HStack(spacing: 12) {
                        HanvestButtonDefault(
                            size: .medium,
                            style: .filledIncorrect(isDisabled: false),
                            title: "Sell") {
                                print("Sell Button Triggered")
                            }
                        HanvestButtonDefault(
                            size: .medium,
                            style: .filledCorrect(isDisabled: false),
                            title: "Buy") {
                                print("Buy Button Triggered")
                            }
                    }
                    .padding(.top, 18)
                    .padding(.horizontal, 20)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .contentview
    
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

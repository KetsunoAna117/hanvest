//
//  HanvestBuyConfirmationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import SwiftUI

struct HanvestBuyStockScreenView: View {
    let router: any AppRouterProtocol
    let stock: SimulationStockEntity
    
    @StateObject var viewmodel: BuyingStockDataViewModel = .init()
    
    var body: some View {
        VStack {
            HanvestNavigationBar(
                label: "Buy \(stock.stockIDName)",
                leadingIcon: Image(systemName: "chevron.left"),
                leadingAction: {
                    router.pop()
                }
            )
            
            VStack(spacing: 24) {
                StockHeaderInformationView(
                    stockCodeName: stock.stockIDName,
                    stockName: stock.stockName,
                    initialPrice: $viewmodel.initialStockPrice,
                    currentPrice: $viewmodel.currentStockPrice
                )
                
                SimulationBuyingCard(viewModel: viewmodel)
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
            
            Spacer()
        }
        .onAppear(){
            viewmodel.setup(
                initialStockPrice: stock.stockPrice.first?.price ?? 0,
                currentStockPrice: stock.stockPrice.last?.price ?? 0
            )
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .simulationBuyingConfirmation(stock: SimulationStockEntity.getMockData().first!)
    
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

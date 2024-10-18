//
//  SimulationStockDetailsView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import SwiftUI

struct SimulationStockDetailsView: View {
    let router: any AppRouterProtocol
    @Binding var selectedStock: SimulationStockEntity?
    
    @StateObject var viewmodel = SimulationStockDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let selectedStock = selectedStock {
                    StockHeaderInformationView(
                        stockCodeName: selectedStock.stockIDName,
                        stockName: selectedStock.stockName,
                        initialPrice: $viewmodel.initialPrice,
                        currentPrice: $viewmodel.currentPrice
                    )
                    
                    HanvestStockPriceChart(
                        viewmodel: HanvestProductPriceChartViewModel(
                            prices: selectedStock.stockPrice),
                        symbolCategoryKeyPath: \.name,
                        displayBy: .hour
                    )
                    StockInvestmentData(selectedStock: selectedStock)
                    
                    StockCompanyProfileInformation(desc: selectedStock.stockDescription)
                }
                else {
                    Text("No Stock selected")
                        .font(.nunito(.title2, .bold))
                }
                
            }
            .padding(.horizontal, 20)
            .onChange(of: selectedStock) { oldValue, newValue in
                viewmodel.initialPrice = newValue?.stockPrice.first?.price ?? 0
                viewmodel.currentPrice = newValue?.stockPrice.last?.price ?? 0
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

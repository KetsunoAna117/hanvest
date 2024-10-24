//
//  ModuleSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 24/10/24.
//

import SwiftUI

struct ModuleSimulationView: View {
    let contentRouter: any Module05RouterProtocol
    
    @ObservedObject var simulationViewModel: Module05ViewModel
    
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
                                style: .filledIncorrect(isDisabled: false),
                                title: "Sell") {
                                    router.push(
                                        .simulationSellingConfirmation(viewModel: viewmodel)
                                    )
                                }
                            HanvestButtonDefault(
                                size: .medium,
                                style: .filledCorrect(isDisabled: false),
                                title: "Buy") {
                                    router.push(
                                        .simulationBuyingConfirmation(viewModel: viewmodel)
                                    )
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
    ModuleSimulationView()
}

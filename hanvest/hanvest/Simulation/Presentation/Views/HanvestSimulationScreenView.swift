//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationScreenView: View {
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
    HanvestSimulationScreenView()
}

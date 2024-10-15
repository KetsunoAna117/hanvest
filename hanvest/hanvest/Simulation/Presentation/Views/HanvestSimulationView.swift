//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
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
                    
                    HStack {
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
                    .padding(.top, 12)
                    .padding(.horizontal, 16)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    HanvestSimulationView()
}

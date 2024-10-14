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
                }
                
            }
        }
    }
}

#Preview {
    HanvestSimulationView()
}

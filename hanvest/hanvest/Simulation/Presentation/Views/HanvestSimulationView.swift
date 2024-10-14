//
//  HanvestSimulationView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import SwiftUI

struct HanvestSimulationView: View {
    @StateObject private var viewmodel = HanvestSimulationViewModel()
    
    @State var selectedStock: String = ""
    
    var body: some View {
        ZStack {
            Color.mineShaft50
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Divider()
                    
                    HanvestStockOptionList(
                        selectedStockID: $selectedStock,
                        simulationStockList: viewmodel.stockList
                    )
                    
                    Divider()
                    
                    if let selectedStock = viewmodel.selectedStock {
                        SimulationStockDetailsView(selectedStock: selectedStock)
                    }
                }
                
            }
        }
        .onAppear(){
            
        }
    }
}

#Preview {
    HanvestSimulationView()
}

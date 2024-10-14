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
        VStack {
            VStack {
                HanvestStockOptionList(
                    selectedStockID: $selectedStock,
                    simulationStockList: <#T##[SimulationStockEntity]#>
                )
                
                Divider()
            }
            
        }
    }
}

#Preview {
    HanvestSimulationView()
}

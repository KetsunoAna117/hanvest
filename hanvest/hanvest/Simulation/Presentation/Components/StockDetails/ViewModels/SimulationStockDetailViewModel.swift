//
//  SimulationStockDetailViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import Foundation

class SimulationStockDetailViewModel: ObservableObject {
    @Inject var getStockByID: GetStockInformationByID
    
    @Published var simulationStock: SimulationStockEntity
    
    init(){
        simulationStock = getStockByID.execute(id: "1")
    }
    
}

//
//  HanvestNewsSimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 17/10/24.
//

import Foundation

class HanvestNewsSimulationViewModel: ObservableObject {
    @Inject var getStockNewsData: GetStockNewsData
    
    @Published var newsList: [SimulationNewsEntity]
    
    init(){
        newsList = []
    }
    
    func setup() {
        newsList = getStockNewsData.execute()
    }
}

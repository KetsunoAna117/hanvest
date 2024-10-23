//
//  Module05SimulationViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import Foundation

class Module05SimulationViewModel: HanvestSimulationViewModel {
    @Inject var getModule05StockData: GetModule05StockData
    
    // CONSTANT
    let MAX_PROGRESS_VALUE = 6
    let MIN_PROGRESS_VALUE = 0
    
    func setup(router: any AppRouterProtocol, viewmodel: HanvestSimulationViewModel, moduleRouter: Module05ContentRouterProtocol) {
        self.stockList = getModule05StockData.execute()
        self.selectedStockID = stockList.first?.stockIDName ?? ""
        moduleRouter.push(
            .buyStage(
                router: router,
                viewModel: viewmodel,
                buyAction: {
                    moduleRouter.push(
                        .confirmBuy(
                            router: router,
                            viewModel: viewmodel
                        )
                    )
                }
            )
        )
    }
    
}

extension Module05SimulationViewModel {
    
}

//
//  AppModule.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

struct AppModule {
    static func inject(){
        //MARK: USE Case
        // Material
        @Provider var getModuleToDisplay: GetModuleToDisplay = GetModuleToDisplayImpl()
        
        // Simulation
        @Provider var getAvailableStocks: GetAvailableSimulationStocks = GetAvailableSimulationStocksImpl()
        @Provider var getStockInformationByID: GetStockInformationByID = GetStockInformationByIDImpl()
        @Provider var getStockNewsData: GetStockNewsData = GetStockDataImpl()
        
        // User
        @Provider var getUserData: GetUserData = GetUserDataImpl()
        @Provider var getUserTransaction: GetUserTransaction = GetUserTransactionImpl()
    }
}


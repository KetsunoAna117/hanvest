//
//  AppModule.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

struct AppModule {
    static func inject(){
        // Simulation Use Case
        @Provider var getAvailableStocks: GetAvailableSimulationStocks = GetAvailableSimulationStocksImpl()
        @Provider var getStockInformationByID: GetStockInformationByID = GetStockInformationByIDImpl()
        
        // User
        @Provider var getUserData: GetUserData = GetUserDataImpl()
    }
}


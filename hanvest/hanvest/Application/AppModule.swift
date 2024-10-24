//
//  AppModule.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

struct AppModule {
    static func inject(){
        
        // MARK: - Repository
        
        let modelContext = SwiftDataContextManager.shared.context
        let userRepository: UserRepository = LocalUserRepository(modelContext: modelContext)
        let simulationNewsRepository: SimulationNewsRepository = LocalSimulationNewsRepository(modelContext: modelContext)
        let simulationStockRepository: SimulationStockRepository = LocalSimulationStockRepository(modelContext: modelContext)
        let productPriceRepository: ProductPriceRepository = LocalProductPriceRepository(modelContext: modelContext)
        let stockTransactionRepository: StockTransactionRepository = LocalStockTransactionRepository(modelContext: modelContext)
        
        // MARK: - USE Case
        
        // Material
        @Provider var getModuleToDisplay: GetModuleToDisplay = GetModuleToDisplayImpl(repo: userRepository)
        @Provider var validateIfUserHasCompletedTheModule: ValidateIfUserHasCompletedTheModule = ValidateIfUserHasCompletedTheModuleImpl(repo: userRepository)
        @Provider var getModule05StockData: GetModule05StockData = GetModule05StockDataImpl()
            
        
        // Simulation
        @Provider var getAvailableStocks: GetAvailableSimulationStocks = GetAvailableSimulationStocksImpl(
            stockRepo: simulationStockRepository,
            productPriceRepo: productPriceRepository
        )
        @Provider var getStockInformationByID: GetStockInformationByID = GetStockInformationByIDImpl(
            stockRepository: simulationStockRepository,
            priceRepository: productPriceRepository
        )
        @Provider var getStockNewsData: GetStockNewsData = GetStockNewsDataImpl(
            newsRepo: simulationNewsRepository
        )
        
        // User
        @Provider var getUserData: GetUserData = GetUserDataImpl(
            userRepo: userRepository,
            transactionRepo: stockTransactionRepository
        )
        @Provider var filterPurchasedUserLot: FilterTransactionByStockIDName = FilterTransactionByStockIDNameImpl()
        
        // Simulation and Material
        @Provider var saveUserModuleProgress: SaveUserModuleProgress = SaveUserModuleProgressImpl(
            userRepo: userRepository
        )
    }
}


//
//  GetStockInformationByID.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 14/10/24.
//

import Foundation

protocol GetStockInformationByID {
    func execute(id: String) -> SimulationStockEntity?
}

struct GetStockInformationByIDImpl: GetStockInformationByID {
    let stockRepository: SimulationStockRepository
    let priceRepository: ProductPriceRepository
    
    func execute(id: String) -> SimulationStockEntity? {
        let fetchedPrice = priceRepository.fetchAllWith(stockID: id)
        
        if let fetchedStock = stockRepository.fetch(stockID: id) {
            return fetchedStock.mapToEntity(productPriceSchema: fetchedPrice)
        }
        
        return nil
    }
}

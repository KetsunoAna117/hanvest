//
//  SellingStockDataConfirmationViewModel.swift
//  hanvest
//
//  Created by Christian Gunawan on 16/10/24.
//

import SwiftUI

class SellingStockDataConfirmationViewModel: ObservableObject {
  
    var stock: String
    var priceStock: Int
    var lot: Int
    var fee: Int
    var priceAmount: Int

    init(stock: String, priceStock: Int, lot: Int, fee: Int) {
        self.stock = stock
        self.priceStock = priceStock
        self.lot = lot
        self.fee = fee
        self.priceAmount = priceStock * lot * 100 + fee
    }
    
}

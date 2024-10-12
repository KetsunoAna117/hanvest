//
//  HanvestProfileHeaderViewModel.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 12/10/24.
//

import Foundation

@Observable class HanvestProfileHeaderViewModel {
    var userBalance: Int
    
    init(){
        self.userBalance = 100000000
    }
    
    func displayBalancePrefixAndSuffix() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "IDR"  // Indonesian Rupiah
        numberFormatter.currencySymbol = "Rp " // Custom currency symbol
        numberFormatter.maximumFractionDigits = 0 // No decimal points
        numberFormatter.locale = Locale(identifier: "id_ID") // Indonesian locale for thousands separator
        
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: userBalance)) {
            return formattedAmount
        } else {
            return "Rp \(userBalance)"
        }
    }
    
}

//
//  HanvestPriceFormatter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 13/10/24.
//

import Foundation

struct HanvestPriceFormatter {
    static func formatIntToIDR(_ num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "IDR"  // Indonesian Rupiah
        numberFormatter.currencySymbol = "Rp " // Custom currency symbol
        numberFormatter.maximumFractionDigits = 0 // No decimal points
        numberFormatter.locale = Locale(identifier: "id_ID") // Indonesian locale for thousands separator
        
        if let formattedAmount = numberFormatter.string(from: NSNumber(value: num)) {
            return formattedAmount
        } else {
            return "Rp \(num)"
        }
    }
}

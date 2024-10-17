//
//  Module03ProductOfInvestmentPriceEntity.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import Foundation

struct Module03ProductOfInvestmentPriceEntity: Equatable {
    var id: String = UUID().uuidString
    var productName: String
    var productPrice: Int
    var time: Date
    
    static func == (lhs: Module03ProductOfInvestmentPriceEntity, rhs: Module03ProductOfInvestmentPriceEntity) -> Bool {
        return
            lhs.productPrice == rhs.productPrice &&
            lhs.time == rhs.time
    }
}

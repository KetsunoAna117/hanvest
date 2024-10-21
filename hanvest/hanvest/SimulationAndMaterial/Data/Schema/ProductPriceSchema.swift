//
//  ProductPriceSchema.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 21/10/24.
//

import Foundation
import SwiftData

@Model final class ProductPriceSchema {
    var id: String?
    var name: String?
    var price: Int?
    var time: Date?
    
    init(id: String? = nil, name: String? = nil, price: Int? = nil, time: Date? = nil) {
        self.id = id
        self.name = name
        self.price = price
        self.time = time
    }
    
    func mapToEntity() -> ProductPriceEntity {
        return ProductPriceEntity(
            id: self.id ?? "",
            name: self.name ?? "",
            price: self.price ?? 0,
            time: self.time ?? Date.distantPast
        )
    }
}

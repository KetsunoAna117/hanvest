//
//  LandCategoryButtonEntity.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 17/10/24.
//

import Foundation
import SwiftUI

struct LandCategoryButtonEntity: Equatable {
    var buttonIDName: String
    var buttonImageName: String
    
    static func getMockData() -> [LandCategoryButtonEntity] {
        return [
            LandCategoryButtonEntity(
                buttonIDName: "Star",
                buttonImageName: "star-logo"
            ),
            LandCategoryButtonEntity(
                buttonIDName: "Jacket",
                buttonImageName: "jacket-logo"
            ),
            LandCategoryButtonEntity(
                buttonIDName: "Short",
                buttonImageName: "short-logo"
            )
            ,
            LandCategoryButtonEntity(
                buttonIDName: "Lipstick",
                buttonImageName: "lipstick-logo"
            )
            ,
            LandCategoryButtonEntity(
                buttonIDName: "Beanie",
                buttonImageName: "beanie-logo"
            )
            ,
            LandCategoryButtonEntity(
                buttonIDName: "Shoe",
                buttonImageName: "shoe-logo"
            )
            ,
            LandCategoryButtonEntity(
                buttonIDName: "Ring",
                buttonImageName: "ring-logo"
            )
        ]
    }
}

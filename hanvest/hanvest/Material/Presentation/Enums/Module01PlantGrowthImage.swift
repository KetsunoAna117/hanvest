//
//  Module01PlantGrowthImage.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

enum PlantGrowthImage {
    case growth01
    case growth02
    case growth03
    case growth04
    case growth05
    case growth06
    case growth07
    
    var image: Image {
        switch self {
            case .growth01:
                Image("plant-growth-1")
            case .growth02:
                Image("plant-growth-2")
            case .growth03:
                Image("plant-growth-3")
            case .growth04:
                Image("plant-growth-4")
            case .growth05:
                Image("plant-growth-5")
            case .growth06:
                Image("plant-growth-6")
            case .growth07:
                Image("plant-growth-7")
        }
    }
}

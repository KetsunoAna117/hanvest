//
//  UserDataCardDefaultState.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 18/10/24.
//

import SwiftUI

enum UserDataCardDefaultState{
    case Profit
    case Loss
    case NoChange
    
    var symbolType: String{
        switch self {
        case .Profit:
            return "+"
        case .Loss:
            return "-"
        case .NoChange:
            return ""
        }
    }
}

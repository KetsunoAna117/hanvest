//
//  CompletionItem.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

enum CompletionItem: CaseIterable {
    case module01
    case module02
    case module03
    case module04
    case module05
    case module06
    // add more modules in later development
    
    var completionPageItem: (badgeImage: Image, achivementName: String, moduleName: String, moneyBonus: Int) {
        switch self {
            case .module01:
                (Image("badge-module-01"), "Basvestment", "Module 1", 1000000)
            case .module02:
                (Image("badge-module-02"), "LvA", "Module 2", 1000000)
            case .module03:
                (Image("badge-module-03"), "Risk Analyzer", "Module 3", 1000000)
            case .module04:
                (Image("badge-module-04"), "Profile Hunter", "Module 4", 1000000)
            case .module05:
                (Image("badge-module-05"), "Investor", "Module 5", 1000000)
            case .module06:
                (Image("badge-module-06"), "Investor", "Module 6", 1000000)
        }
    }
}

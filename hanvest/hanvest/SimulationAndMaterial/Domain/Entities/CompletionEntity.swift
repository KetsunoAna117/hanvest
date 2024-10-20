//
//  ModuleCompletionEntity.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 20/10/24.
//

import Foundation

struct CompletionEntity {
    var badgeName: String
    var badgeImageName: String
    var achievedAfterCompleting: String
    var bonusMoney: Int
}

enum CompletionEntityType {
    case module01
    case module02
    case module03
    case module04
    case module05
    case module06
    
    var value: CompletionEntity {
        switch self {
        case .module01:
            return CompletionEntity(
                badgeName: "Basvestment",
                badgeImageName: "badge-module-01",
                achievedAfterCompleting: "Module 1",
                bonusMoney: 1000000
            )
        case .module02:
            return CompletionEntity(
                badgeName: "LvA",
                badgeImageName: "badge-module-02",
                achievedAfterCompleting: "Module 2",
                bonusMoney: 1000000
            )
        case .module03:
            return CompletionEntity(
                badgeName: "Risk Analyzer",
                badgeImageName: "badge-module-03",
                achievedAfterCompleting: "Module 3",
                bonusMoney: 1000000
            )
        case .module04:
            return CompletionEntity(
                badgeName: "Profile Hunter",
                badgeImageName: "badge-module-04",
                achievedAfterCompleting: "Module 4",
                bonusMoney: 1000000
            )
        case .module05:
            return CompletionEntity(
                badgeName: "Investor",
                badgeImageName: "badge-module-05",
                achievedAfterCompleting: "Module 5",
                bonusMoney: 1000000
            )
        case .module06:
            return CompletionEntity(
                badgeName: "Investor-II",
                badgeImageName: "badge-module-06",
                achievedAfterCompleting: "Module 6",
                bonusMoney: 1000000
            )
        }
    }
}

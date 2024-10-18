//
//  HanvestBadgeViewModels.swift
//  hanvest
//
//  Created by Christian Gunawan on 18/10/24.
//

import SwiftUI

class HanvestBadgeViewModels: ObservableObject {
    @Published var badgeList: [HanvestBadgeEntity] = []
    var isAchieved: Bool
    
    init(badgeList: [HanvestBadgeEntity] = [], isAchieved: Bool = false) {
        self.badgeList = badgeList
        self.isAchieved = isAchieved
    }
    
    func setup() {
        getBadges()
    }
    
    func getBadges() {
        badgeList = [
            HanvestBadgeEntity(id: 1, name: "Basvestment", description: "Module 1", imageName: "badge-module-01", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 2, name: "LvA", description: "Module 2", imageName: "badge-module-02", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 3, name: "Risk Analyzer", description: "Module 3", imageName: "badge-module-03", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 4, name: "ProfileHunter", description: "Module 4", imageName: "badge-module-04", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 5, name: "Investor", description: "Module 5", imageName: "badge-module-05", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 6, name: "Newsvestor", description: "Module 6", imageName: "badge-module-06", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 7, name: "Basvestment", description: "Module 1", imageName: "badge-module-01", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 8, name: "LvA", description: "Module 2", imageName: "badge-module-02", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 9, name: "Risk Analyzer", description: "Module 3", imageName: "badge-module-03", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 10, name: "ProfileHunter", description: "Module 4", imageName: "badge-module-04", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 11, name: "Investor", description: "Module 5", imageName: "badge-module-05", isAchieved: isAchieved),
            HanvestBadgeEntity(id: 12, name: "Newsvestor", description: "Module 6", imageName: "badge-module-06", isAchieved: isAchieved),
        ]
    }
}

//
//  HanvestBadgeEntity.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//

class HanvestBadgeEntity: Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageName: String
    var isAchieved: Bool
    
    init(id: Int, name: String, description: String, imageName: String, isAchieved: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.isAchieved = isAchieved
    }
}

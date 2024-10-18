//
//  HanvestBadgeComponent.swift
//  hanvest
//
//  Created by Christian Gunawan on 17/10/24.
//

import SwiftUI

struct HanvestBadgeComponent: View {
    var state: HanvestBadgeComponentState
    var badge: HanvestBadgeEntity
    
    var body: some View {
            VStack {
                Image(badge.imageName)
                    .resizable()
                    .frame(width: 90, height: 132)
                    .foregroundColor(state.isAchieved ? .yellow : .gray)
                    .font(.nunito(.subhead))
                Text(badge.name)
                    .font(.headline)
                Text(badge.description)
                    .font(.nunito(.caption2))
            } .grayscale(state.isAchieved ? 0 : 1)
    }
}

#Preview {
    ScrollView{
        HanvestBadgeComponent(
            state: .unachieved,
            badge: HanvestBadgeEntity(id: 1, name: "Nama Badge", description: "Short Desc", imageName: "badge-module-01")
        )
        
        HanvestBadgeComponent(
            state: .achieved,
            badge: HanvestBadgeEntity(id: 2, name: "Nama Badge", description: "short Desc", imageName: "badge-module-02")
        )
        
        HanvestBadgeComponent(
            state: .unachieved,
            badge: HanvestBadgeEntity(id: 3, name: "Nama Badge", description: "short Desc", imageName: "badge-module-03")
        )
        
        HanvestBadgeComponent(
            state: .achieved,
            badge: HanvestBadgeEntity(id: 4, name: "Nama Badge", description: "short Desc", imageName: "badge-module-04")
        )
        
        HanvestBadgeComponent(
            state: .unachieved,
            badge: HanvestBadgeEntity(id: 4, name: "Nama Badge", description: "short Desc", imageName: "badge-module-05")
        )
        HanvestBadgeComponent(
            state: .achieved,
            badge: HanvestBadgeEntity(id: 4, name: "Nama Badge", description: "short Desc", imageName: "badge-module-06")
        )
    }
}

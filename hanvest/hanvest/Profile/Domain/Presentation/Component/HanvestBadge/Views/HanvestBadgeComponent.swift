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
                Text(badge.name)
                    .font(.nunito(.subhead))
                Text(badge.description)
                    .font(.nunito(.caption2))
            } .grayscale(state.isAchieved ? 0 : 1)
            .frame(width: 100, height: 176)
    }
}

#Preview {
    ScrollView{
        HanvestBadgeComponent(
            state: .unachieved,
            badge: HanvestBadgeEntity(id: 1, name: "Nama Badge", description: "Short Desc", imageName: "badge-module-01", isAchieved: false)
        )
        
        HanvestBadgeComponent(
            state: .achieved,
            badge: HanvestBadgeEntity(id: 2, name: "Nama Badge", description: "short Desc", imageName: "badge-module-02", isAchieved: true)
        )
        
    }
}

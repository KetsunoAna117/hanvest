//
//  HanvestBadgeListComponent.swift
//  hanvest
//
//  Created by Christian Gunawan on 18/10/24.
//

import SwiftUI

struct HanvestBadgeListComponent: View {
    @StateObject var viewModel = HanvestBadgeViewModels()
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.badgeList) { badge in
                    HanvestBadgeComponent(
                        state: badge.isAchieved ? .achieved : .unachieved,
                        badge: badge
                    )
                }
            }
            .padding()
            .onAppear {
                viewModel.setup()
            }
        }
    }
}

#Preview {
    ScrollView{
        HanvestBadgeListComponent()
    }.padding(20)
}

//
//  CompletionPageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionPageView: View {
    // Constant
    let completionItem: CompletionEntityType
    
    var body: some View {
        VStack(spacing: 54){
            VStack(spacing: 78) {
                VStack(spacing: 12) {
                    Text("Congratulations!")
                        .font(.nunito(.title1, .bold))
                        .frame(maxWidth: .infinity)
                    
                    Image(completionItem.value.badgeImageName)
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text(
                            "You earned "
                        ).font(.nunito(.body)) +
                        Text(
                            "\"\(completionItem.value.badgeName)\""
                        ).font(.nunito(.body, .bold))
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        Text(
                            "for completing "
                        ).font(.nunito(.body)) +
                        Text(
                            "\"\(completionItem.value.achievedAfterCompleting)\""
                        ).font(.nunito(.body, .bold))
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
            .completionCardStyle()
            
            ZStack {
                VStack(spacing: 4) {
                    Text("Bonus:")
                        .font(.nunito(.body))
                        .frame(maxWidth: .infinity)
                    
                    Text(HanvestPriceFormatter.formatIntToIDR(completionItem.value.bonusMoney))
                        .font(.nunito(.title1, .bold))
                        .frame(maxWidth: .infinity)
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 46)
            .completionCardStyle()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CompletionPageView(
        completionItem: .module01
    )
        .padding(.horizontal, 20)
}

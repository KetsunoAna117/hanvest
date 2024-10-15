//
//  CompletionPageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct CompletionPageView: View {
    // Constant
    let completionItem: CompletionItem
    
    var body: some View {
        ZStack {
            VStack(spacing: 54){
                VStack(spacing: 78) {
                    VStack(spacing: 12) {
                        Text("Congratulations!")
                            .font(.nunito(.title1, .bold))
                            .frame(maxWidth: .infinity)
                        
                        completionItem.completionPageItem.badgeImage
                    }
                    
                    VStack(spacing: 0) {
                        HStack {
                            Text(
                                "You earned "
                            ).font(.nunito(.body)) +
                            Text(
                                "\"\(completionItem.completionPageItem.achivementName)\""
                            ).font(.nunito(.body, .bold))
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text(
                                "for completing "
                            ).font(.nunito(.body)) +
                            Text(
                                "\"\(completionItem.completionPageItem.moduleName)\""
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
                        
                        Text(formatToRupiah(completionItem.completionPageItem.moneyBonus))
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
        .padding(.horizontal, 20)
    }
    
    private func formatToRupiah(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        formatter.currencySymbol = "Rp "
        formatter.maximumFractionDigits = 0

        if let formattedString = formatter.string(from: NSNumber(value: number)) {
            return formattedString
        } else {
            return "Rp 0"
        }
    }
}

#Preview {
    CompletionPageView(completionItem: .module01)
}

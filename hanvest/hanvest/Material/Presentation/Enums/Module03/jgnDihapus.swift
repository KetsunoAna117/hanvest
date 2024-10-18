//
//  ygygy.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct BulletedListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(bulletPoints, id: \.self) { bulletPoint in
                HStack(alignment: .top) {
                    Text("•") // Unicode bullet point character
                        .fontWeight(.semibold)
                    
                    Text(bulletPoint)
                }
            }
        }
        .padding()
    }

    // Example data for the bulleted list
    private let bulletPoints = [
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities).",
        "Understanding assets (anything of value), liabilities (debts), income, and expenses is key to managing personal finances. Assets generate income streams, while liabilities represent financial obligations. A personal balance sheet helps individuals clearly monitor their financial position, showing the difference between what they own (assets) and what they owe (liabilities)."
    ]
}

struct BulletedListView_Previews: PreviewProvider {
    static var previews: some View {
        BulletedListView()
    }
}

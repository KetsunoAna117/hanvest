//
//  HanvestMaterialnformationView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestModule03MaterialnformationView: View {
    // Constants
    let title: String
    let detailText: Text
    let bulletPoint: [String]
    
    // Component Contents
    var image: Image?
    
    @ViewBuilder
    var materialExplanationView: some View {
        VStack(spacing: 0) {
            Text("Explanation:")
                .font(.nunito(.callout, .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HanvestModule03BulletPointList(bulletPoints: bulletPoint)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            detailText
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text(title)
                .font(.nunito(.title2))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            
            if let _ = image {
                ScrollView(.vertical) {
                    materialExplanationView
                }
                .frame(width: 351)
            } else {
                materialExplanationView
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable let title = "Preview title"
    @Previewable let detailText = "Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd"
    @Previewable let bulletPoint = ["Preview bullet point 1", "Preview bullet point 2"]
    
    HanvestModule03MaterialnformationView(
        title: title,
        detailText: Text(detailText).font(.callout),
        bulletPoint: bulletPoint,
        image: Image("high-risk-low-risk-triangle")
    )
}

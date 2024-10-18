//
//  HanvestMaterialnformationView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct HanvestMaterialnformationView: View {
    // Constants
    let title: String
    let detailText: Text
    
    // Component Contents
    var bulletPoints: [String]?
    var image: Image?
    
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
            
            ScrollViewIfNeeded {
                VStack(spacing: 0) {
                    if let bulletPoints = bulletPoints {
                        Text("Explanation:")
                            .font(.nunito(.callout, .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HanvestModule03BulletPointList(bulletPoints: bulletPoints)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } else {
                        detailText
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    @Previewable let title = "Preview title"
    @Previewable let detailText = "Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd Preview detail text asudh asduha asudh asudh asudhas duusahd asudh aushda uahs udaushd ausudha sd"
    @Previewable let bulletPoint = ["Preview bullet point 1", "Preview bullet point 2"]
    
    HanvestMaterialnformationView(
        title: title,
        detailText: Text(detailText).font(.callout),
        bulletPoints: bulletPoint,
        image: Image("high-risk-low-risk-triangle")
    )
    .padding(.horizontal, 20)
}

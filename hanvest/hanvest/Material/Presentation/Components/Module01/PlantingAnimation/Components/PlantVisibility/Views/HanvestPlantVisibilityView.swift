//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantVisibilityView: View {
    @State private var plantImage: String = ""
    @Binding var growthProgress: PlantGrowthProgress
    
    var body: some View {
        ZStack {
            ZStack {
                HStack {
                    Image(self.plantImage)
                        .transition(.opacity)
                        .id(self.plantImage)
                }
                .padding(.leading, (growthProgress == .progress13) ? 52 : 46.5)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, (growthProgress == .progress13) ? 314 : 226)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onChange(of: self.growthProgress) { _, newValue in
                self.updateCurrentPlantImage(growthProgress: newValue)
            }
        }
        .allowsHitTesting(false)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func updateCurrentPlantImage(growthProgress: PlantGrowthProgress) {
        withAnimation(.easeInOut) {
            if let matchedImage = PlantImage.allCases.first(where: { $0.rawValue == growthProgress.rawValue }) {
                self.plantImage = matchedImage.plantImageName
            }
        }
    }
}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}

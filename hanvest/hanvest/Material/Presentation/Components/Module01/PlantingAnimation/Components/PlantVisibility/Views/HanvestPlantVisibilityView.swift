//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantVisibilityView: View {
    @State private var plantVisibility: ItemVisibility = .isHidden
    @State private var currentPlantImage: Image?
    @Binding var growthProgress: PlantGrowthProgress
    
    var body: some View {
        ZStack {
            if let plantGrowthImage = self.growthProgress.plantGrowthImage {
                ZStack {
                    HStack {
                        if self.plantVisibility == .isVisible {
                            plantGrowthImage.image
                                .transition(.opacity)
                        }
                    }
                    .padding(.leading, plantGrowthImage.leadingPadding)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, plantGrowthImage.topPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .onAppear {
                    self.updatePlantVisibility(with: plantGrowthImage.image)
                }
                .onChange(of: self.growthProgress) { _, _ in
                    if plantGrowthImage.image != self.currentPlantImage {
                        self.plantVisibility = .isHidden
                        
                        self.updatePlantVisibility(with: plantGrowthImage.image)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func updatePlantVisibility(with image: Image) {
        withAnimation(.spring(duration: 1.0)) {
            self.plantVisibility = .isVisible
            self.currentPlantImage = image
        }
    }
}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}

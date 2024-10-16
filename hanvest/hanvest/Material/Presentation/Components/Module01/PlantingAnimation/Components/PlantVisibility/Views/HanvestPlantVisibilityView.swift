//
//  PlantVisibilityView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct HanvestPlantVisibilityView: View {
    @State private var currentPlantImageName: String = "plant-growth-1"
    @Binding var growthProgress: PlantGrowthProgress
    
    var body: some View {
        ZStack {
            if let plantGrowthImageName = self.growthProgress.plantGrowthImageName {
                ZStack {
                    HStack {
                        Image(currentPlantImageName)
                            .transition(.opacity)
                            .id(currentPlantImageName)
                    }
                    .padding(.leading, (growthProgress == .progress13) ? 52 : 46.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, (growthProgress == .progress13) ? 314 : 226)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .onAppear {
                    self.updateCurrentPlantImageName(imageName: plantGrowthImageName)
                }
                .onChange(of: self.growthProgress) { _, _ in
                    if plantGrowthImageName != self.currentPlantImageName {
                        self.updateCurrentPlantImageName(imageName: plantGrowthImageName)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func updateCurrentPlantImageName(imageName: String) {
        withAnimation(.easeInOut) {
            self.currentPlantImageName = imageName
        }
    }
}

#Preview {
    HanvestPlantVisibilityView(growthProgress: .constant(.progress01))
}

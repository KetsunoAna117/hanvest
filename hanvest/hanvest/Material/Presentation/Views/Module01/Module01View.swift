//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI
import Combine
import SpriteKit

struct Module01View: View {
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var progressBarCurrValue: Int = 4
    @State private var growthProgress: PlantGrowthProgress = .progress01
    @State private var plantVisibility: PlantImageVisibility = .isHidden
    @State private var currentPlantImage: Image?
    @State private var growthTimer: AnyCancellable?
    @State private var spriteScene: Module01SpriteController?
    
    var body: some View {
        ZStack {
            if let spriteScene = self.spriteScene {
                SpriteView(scene: spriteScene)
                    .onAppear {
                        self.startGrowthTimer()
                    }
                    .onChange(of: self.growthProgress) { _, newValue in
                        if newValue == .progress08 {
                            self.startGrowthTimer()
                        }
                    }
            }
            
            ZStack {
                VStack(spacing: 55) {
                    HStack(spacing: 0) {
                        Button {
                            // TODO: Do something
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 24))
                                .foregroundStyle(.labelPrimary)
                        }
                        
                        HStack {
                            HanvestProgressBar(
                                value:
                                    $progressBarCurrValue,
                                minimum:
                                    progressBarMinValue,
                                maximum:
                                    progressBarMaxValue
                            )
                        }
                        .padding(.horizontal, 16)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text("\(self.growthProgress.description)")
                        .font(.nunito(.title2))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 71)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
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
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            let scene = Module01SpriteController(size: UIScreen.main.bounds.size, growthProgress: self.$growthProgress)
            scene.scaleMode = .resizeFill
            self.spriteScene = scene
        }
    }
    
    private func updatePlantVisibility(with image: Image) {
        withAnimation(.spring(duration: 1.0)) {
            self.plantVisibility = .isVisible
            self.currentPlantImage = image
        }
    }
    
    private func startGrowthTimer() {
        self.growthTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            .sink { _ in
                self.handleGrowthTimerEvent()
            }
    }
    
    private func handleGrowthTimerEvent() {
        withAnimation(.easeInOut) {
            let rawValue = growthProgress.rawValue
            
            if !(3...7).contains(rawValue) {
                if let nextProgress = growthProgress.nextProgress() {
                    growthProgress = nextProgress
                } else {
                    self.stopGrowthTimer()
                }
            } else {
                self.stopGrowthTimer()
            }
        }
    }
    
    private func stopGrowthTimer() {
        self.growthTimer?.cancel()
    }
    
    private func resumeGrowthTimer() {
        startGrowthTimer()
    }
}

#Preview {
    Module01View()
}


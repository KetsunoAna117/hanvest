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
            
            HanvestPlantVisibilityView(growthProgress: self.$growthProgress)
            
            if checkEligibilityPlantFlowerBloom() {
                HanvestPlantFlowerBloomView(growthProgress: self.$growthProgress) {
                    self.getNextGrowthProgress()
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
    
    private func startGrowthTimer() {
        self.growthTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            .sink { _ in
                self.handleGrowthTimerEvent()
            }
    }
    
    private func handleGrowthTimerEvent() {
        if (checkForPauseGrowthProgress()) {
            self.getNextGrowthProgress()
        } else {
            self.stopGrowthTimer()
        }
    }
    
    private func getNextGrowthProgress() {
        withAnimation(.easeInOut) {
            if let nextProgress = self.growthProgress.nextProgress() {
                self.growthProgress = nextProgress
            } else {
                if self.growthTimer != nil {
                    self.stopGrowthTimer()
                }
            }
        }
    }
    
    private func stopGrowthTimer() {
        self.growthTimer?.cancel()
    }
    
    private func resumeGrowthTimer() {
        startGrowthTimer()
    }
    
    private func checkForPauseGrowthProgress() -> Bool {
        let currentGrowthProgress = self.growthProgress.rawValue
        
        let waterCanSection = (3...7).contains(currentGrowthProgress)
        let plantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        
        return (!(waterCanSection || plantFlowerBloomSection))
    }
    
    private func checkEligibilityPlantFlowerBloom() -> Bool {
        let currentGrowthProgress = self.growthProgress.rawValue
        let plantGrowthImage = self.growthProgress.plantGrowthImage
        
        let firstConditionPlantFlowerBloomSection = (10...12).contains(currentGrowthProgress)
        let secondConditionPlantFlowerBloomSection = plantGrowthImage?.image == Image("plant-growth-6")
        
        return (firstConditionPlantFlowerBloomSection && secondConditionPlantFlowerBloomSection)
    }
}

#Preview {
    Module01View()
}


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
            if let spriteScene = spriteScene {
                SpriteView(scene: spriteScene)
                    .onAppear {
                        startGrowthTimer()
                    }
                    .onChange(of: self.growthProgress) { _, newValue in
                        if newValue == .progress08 {
                            startGrowthTimer()
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
                    
                    Text("\(growthProgress.description)")
                        .font(.nunito(.title2))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 71)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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


//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI
import SpriteKit

struct Module01View: View {
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var progressBarCurrValue: Int = 4
    @State private var growthProgress: PlantGrowthProgress = .progress01
    @State private var spriteScene: Module01SpriteController?

    var body: some View {
        ZStack {
            if let spriteScene = spriteScene {
                SpriteView(scene: spriteScene)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            if let nextProgress = growthProgress.nextProgress() {
                                growthProgress = nextProgress
                            }
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
}

#Preview {
    Module01View()
}


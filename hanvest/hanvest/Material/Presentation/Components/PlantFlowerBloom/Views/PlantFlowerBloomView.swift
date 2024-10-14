//
//  PlantFlowerBloomView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 14/10/24.
//

import SwiftUI

struct PlantFlowerBloomView: View {
    // Constant
    private let normalTimeToChangePage: CGFloat = 2.0
    private let flowerAndAppleAppearTime: CGFloat = 0.2
    private let allFlowers = FlowerBloomImage.allCases.shuffled()
    
    @State private var visibleFlowers: [FlowerBloomImage] = []
    @State private var displayedImages: [(image: Image, topPadding: CGFloat, leadingPadding: CGFloat)] = []
    @State private var currentFlowerIndex = 0
    @Binding var growthProgress: PlantGrowthProgress
    
    var onCompletion: (() -> Void)?
    
    var body: some View {
        ZStack {
            ForEach(self.visibleFlowers.indices, id: \.self) { index in
                ZStack {
                    HStack {
                        self.displayedImages[index].image
                    }
                    .padding(.leading, self.displayedImages[index].leadingPadding)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, self.displayedImages[index].topPadding)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            self.addNextFlower()
        }
        .onChange(of: self.growthProgress) { _, newValue in
            if newValue == .progress11 {
                self.replaceFlowerWithHalfApple()
            } else if newValue == .progress12 {
                self.replaceFlowerWithFullApple()
            }
        }
    }
    
    func addNextFlower() {
        if self.currentFlowerIndex < self.allFlowers.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + flowerAndAppleAppearTime) {
                let flower = self.allFlowers[currentFlowerIndex]
                self.visibleFlowers.append(flower)
                self.displayedImages.append(flower.flowerImage)
                self.currentFlowerIndex += 1
                self.addNextFlower()
            }
        } else {
            self.returnToMainView(duration: normalTimeToChangePage)
        }
    }
    
    func replaceFlowerWithHalfApple() {
        for (index, flower) in self.visibleFlowers.enumerated() {
            if let halfAppleImage = flower.halfAppleImage?.image, let halfAppleTopPadding = flower.halfAppleImage?.topPadding, let halfAppleLeadingPadding = flower.halfAppleImage?.leadingPadding,
               self.displayedImages[index].image != halfAppleImage {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * flowerAndAppleAppearTime) {
                    self.displayedImages[index] = (halfAppleImage, halfAppleTopPadding, halfAppleLeadingPadding)
                }
            }
        }
        
        let totalDelay = (Double(self.visibleFlowers.count) * self.flowerAndAppleAppearTime) + self.normalTimeToChangePage
        self.returnToMainView(duration: totalDelay)
    }
    
    func replaceFlowerWithFullApple() {
        for (index, flower) in self.visibleFlowers.enumerated() {
            if let fullAppleImage = flower.fullAppleImage?.image, let fullAppleTopPadding = flower.fullAppleImage?.topPadding, let fullAppleLeadingPadding = flower.fullAppleImage?.leadingPadding,
               self.displayedImages[index].image != fullAppleImage {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * flowerAndAppleAppearTime) {
                    self.displayedImages[index] = (fullAppleImage, fullAppleTopPadding, fullAppleLeadingPadding)
                }
            }
        }
        
        let totalDelay = (Double(self.visibleFlowers.count) * self.flowerAndAppleAppearTime) + self.normalTimeToChangePage
        self.returnToMainView(duration: totalDelay)
    }
    
    func returnToMainView(duration: CGFloat) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.onCompletion?()
        }
    }
}

#Preview {
    PlantFlowerBloomView(growthProgress: .constant(.progress01))
}

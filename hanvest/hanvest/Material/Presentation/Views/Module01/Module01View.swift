//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct Module01View: View {
    // Constants
    let totalPage = 2
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let completionItem: CompletionItem = .module01 // TODO: the achivementName and moneyBonus from this enum need to be stored to swiftdata
    
    @State private var plantingViewVisibility: PlantingViewVisibility = .isVisible
    @State private var pageState: Module01PageState = .moduleMaterial
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    
    var body: some View {
        ZStack {
            Color.background
            
            if plantingViewVisibility == .isVisible {
                Module01PlantingView() {
                    plantingViewVisibility = .isHidden
                    updateProgressBarValue()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            ZStack {
                VStack(spacing: 49) {
                    if pageState == .moduleMaterial {
                        ProgressBarWithXMarkView(
                            progressBarMinValue: progressBarMinValue,
                            progressBarMaxValue: progressBarMaxValue,
                            action: {},
                            progressBarCurrValue: $progressBarCurrValue
                        )
                    }
                    
                    if plantingViewVisibility == .isHidden {
                        VStack(spacing: (pageState == .moduleMaterial) ? 227 : 50) {
                            TabView(selection: $currentTab) {
                                
                                if let moduleMaterialContent = pageState.contentOfModuleMaterial {
                                    ForEach(0..<moduleMaterialContent.count, id: \.self) { index in
                                        
                                        HanvestHeaderWithDetailTextView(
                                            spacingBetweenHeaderAndDetail: 24,
                                            headerText: moduleMaterialContent[index].headerText,
                                            detailText: moduleMaterialContent[index].detailText
                                        )
                                        .tag(index)
                                        .transition(.slide)
                                        
                                    }
                                }
                                
                                CompletionPageView(completionItem: completionItem)
                                    .tag(2)
                                    .transition(.slide)
                            }
                            .frame(maxWidth: .infinity)
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            
                            ZStack {
                                HanvestButtonDefault(
                                    title: pageState.buttonStringValue
                                ) {
                                    goToNextPage()
                                    updateProgressBarValue()
                                    changePageState()
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func goToNextPage() {
        if currentTab < totalPage {
            currentTab += 1
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    func changePageState() {
        if currentTab == totalPage {
            pageState = .claimReward
        }
    }
    
    func updateProgressBarValue() {
        if pageState == .moduleMaterial {
            progressBarCurrValue += (progressBarMaxValue / (totalPage + 1))
        }
    }
    
}

#Preview {
    Module01View()
}


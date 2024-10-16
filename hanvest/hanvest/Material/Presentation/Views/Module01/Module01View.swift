//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct Module01View: View {
    // Constants
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
                            action: {
                                // TODO: DO SOMETHING
                            },
                            progressBarCurrValue: $progressBarCurrValue
                        )
                    }
                    
                    if plantingViewVisibility == .isHidden {
                        VStack(spacing: (pageState == .moduleMaterial) ? 227 : 50) {
                            TabView(selection: $currentTab) {
                                
                                ForEach(Array(ContentOfModule01Material.allCases.enumerated()), id: \.offset) { index, content in
                                        
                                        HanvestHeaderWithDetailTextView(
                                            headerText: content.headerContent,
                                            detailText: content.detailContent
                                        )
                                        .tag(content.rawValue)
                                        .transition(.slide)
                                        
                                    }
                                
                                CompletionPageView(completionItem: completionItem)
                                    .tag(Module01PageState.claimReward.rawValue)
                                    .transition(.slide)
                            }
                            .frame(maxWidth: .infinity)
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .indexViewStyle(.page(backgroundDisplayMode: .always))
                            .onAppear {
                                UIScrollView.appearance().isScrollEnabled = false
                            }
                            
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
        if currentTab < Module01PageState.claimReward.rawValue {
            currentTab += 1
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    func changePageState() {
        if currentTab == Module01PageState.claimReward.rawValue {
            pageState = .claimReward
        }
    }
    
    func updateProgressBarValue() {
        if pageState == .moduleMaterial {
            progressBarCurrValue += (progressBarMaxValue / (Module01PageState.claimReward.rawValue + 1))
        }
    }
    
}

#Preview {
    Module01View()
}


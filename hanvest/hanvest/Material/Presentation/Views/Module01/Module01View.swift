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
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var plantingViewVisibility: PlantingViewVisibility = .isVisible
    @State private var pageState: Module01PageState = .pageModuleMaterial
    
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
                    if pageState == .pageModuleMaterial {
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
                        VStack(spacing: 48) {
                            TabView(selection: $currentTab) {
                                
                                ForEach(Array(ContentOfModule01Material.allCases.enumerated()), id: \.offset) { index, content in
                                        
                                        HanvestMaterialnformationView(
                                            title: Text(content.headerContent).font(.nunito(.title2)),
                                            detailText: content.detailContent
                                        )
                                        .tag(content.rawValue)
                                        .transition(.slide)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        
                                    }
                                
                                CompletionPageView(completionItem: .module01)
                                    .tag(Module01PageState.pageClaimReward.rawValue)
                                    .transition(.slide)
                                    .frame(maxHeight: .infinity, alignment: .bottom)
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
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func goToNextPage() {
        if currentTab < Module01PageState.pageClaimReward.rawValue {
            currentTab += 1
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if currentTab == Module01PageState.pageClaimReward.rawValue {
            pageState = .pageClaimReward
        }
    }
    
    private func updateProgressBarValue() {
        if pageState == .pageModuleMaterial {
            progressBarCurrValue += (progressBarMaxValue / (Module01PageState.pageClaimReward.rawValue + 1))
        }
    }
    
}

#Preview {
    Module01View()
}


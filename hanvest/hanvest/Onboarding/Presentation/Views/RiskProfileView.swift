//
//  RiskProfileView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileView: View {
    // Constant
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var pageState: RiskProfilePageState = .openingPage
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 10
    
    // View Model
    @State private var viewModel = RiskProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 58) {
                    if pageState == .questionPage {
                        HanvestProgressBar(
                            value:
                                $progressBarCurrValue,
                            minimum:
                                progressBarMinValue,
                            maximum:
                                progressBarMaxValue
                        )
                        .padding(.horizontal, 36)
                        .frame(maxWidth: .infinity)
                    }
                    
                    VStack(spacing: 230) {
                        TabView(selection: $currentTab) {
                            HanvestRiskProfileOpeningView()
                                .tag(RiskProfilePageState.openingPage.rawValue)
                                .transition(.slide)
                            
                            ForEach(Array(RiskProfileQuestionsAndOptions.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestSelectableOptionsView(
                                    headerText:
                                        page.questions,
                                    choicesText:
                                        page.options,
                                    eachComponentSpacing: 24,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[index] = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                            }
                            
                            HanvestRiskProfileResultView(
                                resultState: viewModel.resultState
                            )
                            .tag(RiskProfilePageState.resultPage.rawValue)
                            .transition(.slide)
                        }
                        .frame(maxWidth: .infinity)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .onAppear {
                            UIScrollView.appearance().isScrollEnabled = false
                        }
                        
                        HanvestButtonDefault(
                            style:
                                .filled(isDisabled: checkIsDisabled()),
                            title:
                                pageState.buttonStringValue
                        ) {
                            goToNextPage()
                            changePageState()
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, (pageState == .questionPage) ? 74 : 140)
            .padding(.bottom, 54)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func goToNextPage() {
        if currentTab < RiskProfilePageState.resultPage.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if currentTab < RiskProfilePageState.resultPage.rawValue {
            pageState = .questionPage
        } else {
            pageState = .resultPage
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / RiskProfileQuestionsAndOptions.allCases.count)
    }
    
    private func checkIsDisabled() -> Bool {
        return pageState == .questionPage && viewModel.userSelectedAnswers[currentTab - 1].isEmpty
    }
}

#Preview {
    RiskProfileView()
}

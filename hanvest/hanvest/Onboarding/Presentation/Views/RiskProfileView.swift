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
    
    @State private var pageState: RiskProfilePageState = .pageOpening
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 10
    
    // View Model
    @State private var viewModel = RiskProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 58) {
                    if pageState == .pageQuestion {
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
                    
                    VStack(spacing: 0) {
                        TabView(selection: $currentTab) {
                            HanvestRiskProfileOpeningView()
                                .tag(RiskProfilePageState.pageOpening.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                            
                            ForEach(Array(RiskProfileQuestionsAndOptions.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoice(
                                    question: page.questions,
                                    options: page.options,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[index] = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)

                            }
                            
                            HanvestRiskProfileResultView(
                                resultState: viewModel.resultState
                            )
                            .tag(RiskProfilePageState.pageRiskResult.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
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
            .padding(.top, (pageState == .pageQuestion) ? 74 : 140)
            .padding(.bottom, 54)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    private func goToNextPage() {
        if currentTab < RiskProfilePageState.pageRiskResult.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if currentTab < RiskProfilePageState.pageRiskResult.rawValue {
            pageState = .pageQuestion
        } else {
            pageState = .pageRiskResult
        }
    }
    
    private func updateProgressBarValue() {
        if pageState == .pageQuestion {
            progressBarCurrValue += (progressBarMaxValue / RiskProfileQuestionsAndOptions.allCases.count)
        }
    }
    
    private func checkIsDisabled() -> Bool {
        return pageState == .pageQuestion && viewModel.userSelectedAnswers[currentTab - 1].isEmpty
    }
}

#Preview {
    RiskProfileView()
}

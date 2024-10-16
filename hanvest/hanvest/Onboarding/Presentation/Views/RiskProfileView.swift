//
//  RiskProfileView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileView: View {
    // Constant
    let totalPage = 7
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
                                .tag(0)
                                .transition(.slide)
                            
                            ForEach(Array(RiskProfileQuestionsAndOptions.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoiceView(
                                    question:
                                        page.questions,
                                    answers:
                                        page.options,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[index] = answer
                                    }
                                )
                                .tag(index+1)
                                .transition(.slide)
                            }
                            
                            HanvestRiskProfileResultView(
                                resultState: viewModel.resultState
                            )
                            .tag(7)
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
                            updateProgressBarValue()
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
    
    func goToNextPage() {
        if currentTab < totalPage {
            currentTab += 1
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    func changePageState() {
        if currentTab < totalPage {
            pageState = .questionPage
        } else {
            pageState = .resultPage
        }
    }
    
    func updateProgressBarValue() {
        if pageState == .questionPage {
            progressBarCurrValue += (progressBarMaxValue / RiskProfileQuestionsAndOptions.allCases.count)
        }
    }
    
    func checkIsDisabled() -> Bool {
        return pageState == .questionPage && viewModel.userSelectedAnswers[currentTab - 1].isEmpty
    }
}

#Preview {
    RiskProfileView()
}

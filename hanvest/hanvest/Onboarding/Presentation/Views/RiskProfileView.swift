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
    @State private var resultState: RiskProfileResultState = .conservative
    @State private var currentTab: Int = 0
    @State private var progressBarValue: Int = 10
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 58) {
                    if pageState == .questionPage {
                        HanvestProgressBar(
                            value:
                                $progressBarValue,
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
                                
                                HanvestMultipleChoiceView(        question:
                                        page.questions,
                                    answers:
                                        page.options
                                )
                                .tag(index+1)
                                .transition(.slide)
                            }
                            
                            HanvestRiskProfileResultView(
                                image:
                                    resultState.riskImage,
                                riskHeaderText:
                                    resultState.riskHeaderText,
                                riskDetailText:
                                    resultState.riskDetailText
                            )
                            .tag(7)
                            .transition(.slide)
                        }
                        .frame(maxWidth: .infinity)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        
                        HanvestButtonDefault(
                            title: pageState.buttonStringValue
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
            .padding(.top, pageState == .questionPage ? 74 : 140)
            .padding(.bottom, 54)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
    
    func goToNextPage() {
        if currentTab <= totalPage {
            currentTab += 1
        }
        if currentTab == totalPage + 1 {
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
            progressBarValue += (progressBarMaxValue / RiskProfileQuestionsAndOptions.allCases.count)
        }
    }
}

#Preview {
    RiskProfileView()
}

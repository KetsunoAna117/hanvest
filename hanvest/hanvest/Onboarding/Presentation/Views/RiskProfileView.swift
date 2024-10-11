//
//  RiskProfileView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileView: View {
    // Constant
    let totalPage = 8
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var pageState: RiskProfilePageState = .openingPage
    @State private var currentTab: Int = 0
    
    // ViewModel
    @State private var viewModel = RiskProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            if pageState == .questionPage {
                ZStack {
                    HanvestProgressBar(
                        value:
                            $viewModel.progressBarValue,
                        minimum:
                            progressBarMinValue,
                        maximum:
                            progressBarMaxValue
                    )
                }
                .padding(.horizontal, 36)
                .padding(.top, 74)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            
            ZStack {
                VStack(spacing: 230) {
                    TabView(selection: $currentTab) {
                        HanvestRiskProfileOpeningView()
                            .tag(0)
                            .transition(.slide)
                        
                        HanvestMultipleChoiceView(        question:
                                "Are you new to stock market?",
                            answers:
                                [
                                    "Yes, I'm completely new.",
                                    "I've done some research.",
                                    "I’ve invested a little, but I’m still learning.",
                                    "I’ve Invested and understand how it work."
                                ])
                        .tag(1)
                        .transition(.slide)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    HanvestButtonDefault(title: pageState.buttonStringValue) {
                        goToNextPage()
                        changePageState()
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 140)
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

        }
    }
    
    func changePageState() {
        if currentTab < totalPage {
            pageState = .questionPage
        } else {
            pageState = .resultPage
        }
    }
}

// progress bar
//            VStack {
//                HanvestProgressBar(value: $viewModel.progressBarValue, minimum: progressBarMinValue, maximum: progressBarMaxValue)
//            }

#Preview {
    RiskProfileView()
}

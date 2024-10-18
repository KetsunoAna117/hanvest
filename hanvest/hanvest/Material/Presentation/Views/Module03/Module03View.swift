//
//  Module03View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 17/10/24.
//

import SwiftUI

struct Module03View: View {
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let completionItem: CompletionItem = .module03
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module03PageState = .pageContinue
    @State private var isAnswered: CheckIsAnswered = .notAnswered
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 49) {
                    if pageState != .pageClaimReward {
                        ProgressBarWithXMarkView(
                            progressBarMinValue: progressBarMinValue,
                            progressBarMaxValue: progressBarMaxValue,
                            action: {
                                // TODO: DO SOMETHING
                            },
                            progressBarCurrValue: $progressBarCurrValue
                        )
                    }
                    
                    VStack(spacing: 48) {
                        TabView(selection: $currentTab) {
                            
                            ForEach(Array(Module03AllContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestHeaderWithDetailContent(
                                    headerText: Text(page.headerText).font(.nunito(.title2)),
                                    detailText: page.detailText,
                                    image: (page == .page05) ? Image("high-risk-low-risk-triangle") : nil,
                                    customSpacing: ((0...3).contains(page.rawValue)) ? 0 : nil,
                                    choicesText: page.choicesText,
                                    productStage: ((1...3).contains(page.rawValue)) ? page.rawValue - 1 : nil,
                                    onSelectAnswer: {
                                        if isAnswered == .notAnswered {
                                            isAnswered = .answered
                                        }
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            CompletionPageView(completionItem: completionItem)
                                .tag(Module03PageState.pageClaimReward.rawValue)
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
                                style: .filled(isDisabled: checkIsDisabled()),
                                title: pageState.buttonStringValue
                            ) {
                                goToNextPage()
                                changePageState()
                            }
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func goToNextPage() {
        if currentTab < Module03PageState.pageClaimReward.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if (Module03AllContent.page02.rawValue...Module03AllContent.page03.rawValue).contains(currentTab) {
            pageState = .pageNextMonth
        } else if currentTab == Module03PageState.pageClaimReward.rawValue  {
            pageState = .pageClaimReward
        } else {
            pageState = .pageContinue
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / (Module03PageState.pageClaimReward.rawValue))
    }
    
    private func checkIsDisabled() -> Bool {
        if let currentChoice = Module03AllContent.allCases.first(where: { $0.rawValue == currentTab }) {
            let isChoicesAvailable = (
                currentChoice.choicesText != nil
            )
            return (isChoicesAvailable) && (isAnswered == .notAnswered)
        }
        
        return false
    }
}

#Preview {
    Module03View()
}

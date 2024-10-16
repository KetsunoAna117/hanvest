//
//  Module02View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct Module02View: View {
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let completionItem: CompletionItem = .module02
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module02PageState = .pageContinue
    
    // View Models
    @State private var viewModel = Module02ViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 49) {
                    if pageState != .pageClaimReward {
                        ProgressBarWithXMarkView(
                            progressBarMinValue: progressBarMinValue,
                            progressBarMaxValue: progressBarMaxValue,
                            action: {},
                            progressBarCurrValue: $progressBarCurrValue
                        )
                    }
                    
                    VStack(spacing: 48) {
                        TabView(selection: $currentTab) {
                            
                            ForEach(Array(Module02TextImageChoices.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestSelectableOptionsView(
                                    headerText: page.headerText,
                                    image: page.image,
                                    choicesText: page.choicesText,
                                    choicesColor: page.choicesColor,
                                    eachComponentSpacing: page.eachComponentSpacing,
                                    textAndImageSpacing: page.textAndImageSpacing,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[index] = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(Module02HeaderWithDetailText.allCases.enumerated()), id: \.offset) { index, page in
                                
                                if checkPageToSkip(page: page, userSelectedAnswer: viewModel.checkUserLastSelectedAnswer()) {
                                    EmptyView()
                                } else {
                                    
                                    if let selectedAnswer = viewModel.userSelectedAnswers.first {
                                        
                                        HanvestHeaderWithDetailTextView(
                                            headerText: page.headerText(userSelectedAnswer: selectedAnswer),
                                            detailText: page.detailText(userSelectedAnswer: selectedAnswer)
                                        )
                                        .tag(
                                            adjustPageStateRawValue(
                                                rawValue: page.rawValue
                                            )
                                        )
                                        .transition(.slide)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        
                                    }
                                }
                            }
                            
                            CompletionPageView(completionItem: completionItem)
                                .tag(Module02PageState.pageClaimReward.rawValue)
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
        if currentTab < Module02PageState.pageClaimReward.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if currentTab == Module02TextImageChoices.page06.rawValue {
            pageState = .pageCheckout
        } else if currentTab == Module02TextImageChoices.page07.rawValue {
            pageState = .pagePay
        } else if currentTab == Module02PageState.pageClaimReward.rawValue  {
            pageState = .pageClaimReward
        } else {
            pageState = .pageContinue
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / (Module02PageState.pageClaimReward.rawValue))
    }
    
    private func checkPageToSkip(page: Module02HeaderWithDetailText, userSelectedAnswer: Bool) -> Bool {
        return (
            (
                userSelectedAnswer && (page == .page08Alt2 || page == .page09Alt2)
            ) || (
                !userSelectedAnswer && (page == .page08 || page == .page09)
            )
        )
    }
    
    private func adjustPageStateRawValue(rawValue: Int) -> Int {
        if rawValue > Module02PageState.pageClaimReward.rawValue {
            return (rawValue / Module02PageState.pageClaimReward.rawValue)
        } else {
            return rawValue
        }
    }
    
    private func checkIsDisabled() -> Bool {
        if let currentChoice = Module02TextImageChoices.allCases.first(where: { $0.rawValue == currentTab }) {
            let isChoicesAvailable = (currentChoice.choicesText != nil || currentChoice.choicesColor != nil)
            return isChoicesAvailable && viewModel.userSelectedAnswers[currentTab].isEmpty
        }
        
        return false
    }
    
}

#Preview {
    Module02View()
}

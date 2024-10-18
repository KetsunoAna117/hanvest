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
    @State private var selectedProductIndex: Int = 0
    
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
                            
                            HanvestMultipleChoice(
                                question: Module03MultipleChoice.page01.question,
                                options: Module03MultipleChoice.page01.options){ answer in
                                checkSelectedProductIndex(answer: answer)
                            }
                            .tag(Module03MultipleChoice.page01.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    selectedProductIndex = -1
                                }
                            }
                            
                            if selectedProductIndex != -1 {
                                ForEach(Array(Module03ProductOfInvestmentContent.allCases.enumerated()), id: \.offset) { index, page in
                                    
                                    HanvestModule03AllProductOfInvestmentView(
                                        title: page.title,
                                        selectedProductIndex: selectedProductIndex,
                                        productStage: page.rawValue - 1
                                    )
                                    .tag(page.rawValue)
                                    .transition(.slide)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    
                                }
                            }
                            
                            ForEach(Array(Module03MaterialInformationContent.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMaterialnformationView(
                                    title: Text(page.title).font(.nunito(.title2)),
                                    detailText: page.detailText,
                                    image: (page == .page05) ? [Image("high-risk-low-risk-triangle")] : nil,
                                    bulletPoints: page.bulletPoints
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
                                initialState: .pressed,
                                title: pageState.buttonStringValue
                            ) {
                                goToNextPage()
                                changePageState()
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
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
        if (Module03ProductOfInvestmentContent.page02.rawValue...Module03ProductOfInvestmentContent.page03.rawValue).contains(currentTab) {
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
        return (selectedProductIndex == -1) && (currentTab == Module03MultipleChoice.page01.rawValue)
    }
    
    private func checkSelectedProductIndex(answer: String) {
        for optionCase in Module03MultipleChoice.allCases {
            if let index = optionCase.options.firstIndex(of: answer) {
                self.selectedProductIndex = index
                return
            }
        }
    }
}

#Preview {
    Module03View()
}

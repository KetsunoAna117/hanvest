//
//  Module02View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct Module02View: View {
    // Constants
    let totalPage = 10
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let completionItem: CompletionItem = .module02
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module02PageState = .page01
    
    // View Models
    @State private var viewModel = Module02ViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 49) {
                    if pageState != .claimRewardPage {
                        ProgressBarWithXMarkView(
                            progressBarMinValue: progressBarMinValue,
                            progressBarMaxValue: progressBarMaxValue,
                            action: {},
                            progressBarCurrValue: $progressBarCurrValue
                        )
                    }
                    
                    VStack(spacing: 238) {
                        TabView(selection: $currentTab) {
                            
                            createPageLoopForEach(
                                pageSegment: Module02PageLoopSegmentation.textImage
                            ) { pageState, index in
                                if let content = Module02PageLoopSegmentation.textImage.textImageContent?[index] {
                                    
                                    HanvestTextWithImageView(
                                        headerText: content.headerText,
                                        image: content.imageText,
                                        textAndImageSpacing: 65
                                    )
                                    .tag(pageState.rawValue)
                                    .transition(.slide)
                                    
                                }
                            }
                            
                            createPageLoopForEach(
                                pageSegment: Module02PageLoopSegmentation.textImageWithButtonDefault
                            ) { pageState, index in
                                if let content = Module02PageLoopSegmentation.textImageWithButtonDefault.textImageWithButtonDefaultContent?[index] {
                                    
                                    HanvestTextImageWithButtonDefault(
                                        headerText: content.headerText,
                                        image: content.imageText,
                                        textAndImageSpacing: 65,
                                        choices: content.choices,
                                        onSelectAnswer: { answer in
                                            viewModel.userSelectedAnswers[index] = answer
                                        }
                                    )
                                    .tag(pageState.rawValue)
                                    .transition(.slide)
                                    
                                }
                            }
                            
                            if let page04Content = Module02PageState.page04.page04Content {
                                
                                HanvestTextImageWithRadioButton(
                                    headerText: page04Content
                                )
                                .tag(Module02PageState.page04.rawValue)
                                .transition(.slide)
                                
                            }
                            
                            if let page07Content = Module02PageState.page07.page07Content {
                                
                                HanvestMultipleChoiceView(
                                    question: page07Content.headerText,
                                    answers: page07Content.choices,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[Module02PageLoopSegmentation.textImageWithButtonDefault.pageSegmentation.count - 1] = answer
                                    }
                                )
                                .tag(Module02PageState.page07.rawValue)
                                .transition(.slide)
                                
                            }
                            
                            
                            if viewModel.checkUserLastSelectedAnswer() {
                                
                                createPageLoopForEach(
                                    pageSegment: Module02PageLoopSegmentation.headerWithDetailTextMain
                                ) { pageState, index in
                                    if let content = Module02PageLoopSegmentation.headerWithDetailTextMain.headerWithDetailTextContent?[index] {
                                        
                                        HanvestHeaderWithDetailTextView(
                                            spacingBetweenHeaderAndDetail: 24,
                                            headerText: content.headerText,
                                            detailText: content.detailText
                                        )
                                        .tag(pageState.rawValue)
                                        .transition(.slide)
                                        
                                    }
                                }
                                
                            } else {
                                
                                createPageLoopForEach(
                                    pageSegment: Module02PageLoopSegmentation.headerWithDetailTextAlt
                                ) { pageState, index in
                                    if let content = Module02PageLoopSegmentation.headerWithDetailTextAlt.headerWithDetailTextContent?[index] {
                                        
                                        HanvestHeaderWithDetailTextView(
                                            spacingBetweenHeaderAndDetail: 24,
                                            headerText: content.headerText,
                                            detailText: content.detailText
                                        )
                                        .tag(pageState.rawValue)
                                        .transition(.slide)
                                        
                                    }
                                }
                                
                            }
                            
                            if let page10Content = Module02PageState.page10.page10Content {
                                
                                HanvestHeaderWithDetailTextView(
                                    spacingBetweenHeaderAndDetail: 24,
                                    headerText: page10Content.headerText,
                                    detailText: page10Content.detailText
                                )
                                .tag(Module02PageState.page10.rawValue)
                                .transition(.slide)
                                
                            }
                            
                            CompletionPageView(completionItem: completionItem)
                                .tag(Module02PageState.claimRewardPage.rawValue)
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
            .padding(.top, 71)
            .padding(.bottom, 54)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func goToNextPage() {
        if currentTab < totalPage {
            currentTab += 1
        } else {
            // TODO: direct to the corresponding page
        }
    }
    
    private func changePageState() {
        if currentTab < totalPage {
            if pageState == .page07 && !(viewModel.checkUserLastSelectedAnswer()) {
                pageState = .page08Alt2
            } else if pageState == .page09 {
                pageState = .page10
            } else {
                pageState = pageState.nextPage()
            }
        } else {
            pageState = .claimRewardPage
        }
        
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / (totalPage))
    }
    
    private func createPageLoopForEach<T: View>(
        pageSegment: Module02PageLoopSegmentation,
        @ViewBuilder content: @escaping (Module02PageState, Int) -> T
    ) -> some View {
        ForEach(0..<pageSegment.pageSegmentation.count, id: \.self) { index in
            let pageState = pageSegment.pageSegmentation[index]

            content(adjustedPageState(for: pageState, in: pageSegment), index)
        }
    }

    private func adjustedPageState(for pageState: Module02PageState, in pageSegment: Module02PageLoopSegmentation) -> Module02PageState {
        if pageSegment == .headerWithDetailTextAlt {
            switch pageState {
            case .page08Alt2:
                return .page08
            case .page09Alt2:
                return .page09
            default:
                return pageState
            }
        } else {
            return pageState
        }
    }
}

#Preview {
    Module02View()
}

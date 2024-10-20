//
//  Module02View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct Module02View: View {
    let router: any AppRouterProtocol
    
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module02PageState = .pageContinue
    
    // View Models
    @StateObject private var viewModel = Module02ViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                VStack(spacing: 49) {
                    ProgressBarWithXMarkView(
                        progressBarMinValue: progressBarMinValue,
                        progressBarMaxValue: progressBarMaxValue,
                        action: {
                            router.popToRoot()
                        },
                        progressBarCurrValue: $progressBarCurrValue
                    )
                    
                    VStack(spacing: 48) {
                        TabView(selection: $currentTab) {
                            
                            ForEach(Array(Module02TextImage.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestModule02TextImageView(
                                    title: page.title,
                                    image: page.image,
                                    customSpacing: page.customSpacing
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            ForEach(Array(Module02MultipleChoice.allCases.enumerated()), id: \.offset) { index, page in
                                
                                HanvestMultipleChoice(
                                    question: page.questions,
                                    options: page.options,
                                    image: page.image,
                                    onSelectAnswer: { answer in
                                        viewModel.userSelectedAnswers[page.rawValue] = answer
                                    }
                                )
                                .tag(page.rawValue)
                                .transition(.slide)
                                .frame(maxHeight: .infinity, alignment: .top)
                                
                            }
                            
                            HanvestModule02TextImageColorPickerView(
                                title: Module02TextImageColorPicker.page04.title,
                                image: Module02TextImageColorPicker.page04.image,
                                customSpacing: Module02TextImageColorPicker.page04.customSpacing,
                                needColorPicker: true,
                                onSelectAnswer: { answer in
                                    viewModel.userSelectedAnswers[Module02TextImageColorPicker.page04.rawValue] = answer
                                }
                            )
                            .tag(Module02TextImageColorPicker.page04.rawValue)
                            .transition(.slide)
                            .frame(maxHeight: .infinity, alignment: .top)
                            
                            ForEach(Array(Module02HeaderWithDetailText.allCases.enumerated()), id: \.offset) { index, page in
                                
                                if checkPageToSkip(
                                    page: page,
                                    userSelectedAnswer: viewModel.checkDebitOrPayLater()
                                ) {
                                    EmptyView()
                                } else {
                                    HanvestMaterialnformationView(
                                        title: page.title(userSelectedAnswer: viewModel.checkIphoneOrIphoneProMax()),
                                        detailText: page.detailText(userSelectedAnswer: viewModel.checkIphoneOrIphoneProMax())
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
        if currentTab < Module02PageState.pageClaimReward.rawValue {
            if !checkIsDisabled() {
                currentTab += 1
                updateProgressBarValue()
            }
        } else {
            router.push(.moduleCompletion(completionItem: .module02))
        }
    }
    
    private func changePageState() {
        switch currentTab {
            case Module02TextImage.page06.rawValue:
                pageState = .pageCheckout
            case Module02MultipleChoice.page07.rawValue:
                pageState = .pagePay
            case Module02PageState.pageClaimReward.rawValue:
                pageState = .pageClaimReward
            default:
                pageState = .pageContinue
        }
    }
    
    private func updateProgressBarValue() {
        progressBarCurrValue += (progressBarMaxValue / (Module02PageState.pageClaimReward.rawValue))
    }
    
    private func checkIsDisabled() -> Bool {
        guard currentTab < viewModel.userSelectedAnswers.count else {
            return false
        }
        
        let isPage04 = (currentTab == Module02TextImageColorPicker.page04.rawValue)
        let isChoicePage = Module02MultipleChoice.allCases.contains(where: { $0.rawValue == currentTab })
        let isAnswerEmpty = viewModel.userSelectedAnswers[currentTab].isEmpty
        
        return (isPage04 || isChoicePage) && isAnswerEmpty
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
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule02
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}

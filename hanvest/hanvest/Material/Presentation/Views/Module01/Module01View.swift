//
//  Module01View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct Module01View: View {
    let router: any AppRouterProtocol
    
    // Constants
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let lastPage = ContentOfModule01Material.page02.rawValue
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var plantingViewVisibility: PlantingViewVisibility = .isVisible
    
    var body: some View {
        ZStack {
            Color.background
            
            if plantingViewVisibility == .isVisible {
                Module01PlantingView() {
                    plantingViewVisibility = .isHidden
                    updateProgressBarValue()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
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
                    
                    if plantingViewVisibility == .isHidden {
                        VStack(spacing: 48) {
                            TabView(selection: $currentTab) {
                                
                                ForEach(Array(ContentOfModule01Material.allCases.enumerated()), id: \.offset) { index, content in
                                        
                                        HanvestMaterialnformationView(
                                            title: Text(content.headerContent).font(.nunito(.title2)),
                                            detailText: content.detailContent
                                        )
                                        .tag(content.rawValue)
                                        .transition(.slide)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        
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
                                    title: "Continue"
                                ) {
                                    goToNextPage()
                                    updateProgressBarValue()
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
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
        if currentTab < lastPage {
            currentTab += 1
        } else {
            router.push(.moduleCompletion(completionItem: .module01))
        }
    }
    
    private func updateProgressBarValue() {
        if plantingViewVisibility == .isHidden {
            progressBarCurrValue += (progressBarMaxValue / (lastPage + 1))
        }
    }
    
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule01
    
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


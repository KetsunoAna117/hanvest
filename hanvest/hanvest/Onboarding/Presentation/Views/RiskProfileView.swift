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
            Color
                .background
            
            VStack(spacing: 0) {
                TabView(selection: $currentTab){
                    LandingPageView()
                }
                .tag(1)
                .transition(.slide)
                
                HanvestButtonDefault(title: pageState.buttonStringValue) {
                    goToNextPage()
                }
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
    }
    
    func goToNextPage() {
        if currentTab <= totalPage {
            currentTab += 1
        }
        if currentTab == totalPage + 1 {

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

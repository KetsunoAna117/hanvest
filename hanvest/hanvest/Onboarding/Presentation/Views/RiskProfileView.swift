//
//  RiskProfileView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileView: View {
    // Constant
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    // ViewModel
    @State private var viewModel = RiskProfileViewModel()
    
    var body: some View {
        ZStack {
            Color
                .background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HanvestProgressBar(value: $viewModel.progressBarValue, minimum: progressBarMinValue, maximum: progressBarMaxValue)
            }
        }
    }
}

#Preview {
    RiskProfileView()
}

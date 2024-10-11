//
//  LandingPageView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ZStack {
            Color.background
            
            VStack(spacing: 24) {
                VStack {
                    // TODO: replace the rectangle with logo
                    Rectangle()
                        .frame(maxWidth: 180, maxHeight: 180)
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    Text("Hanvesting")
                        .frame(maxWidth: .infinity)
                    
                    Text("\"Harvesting Knowledge, Growing Wealth: Invest in Your Future!\"")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    LandingPageView()
}

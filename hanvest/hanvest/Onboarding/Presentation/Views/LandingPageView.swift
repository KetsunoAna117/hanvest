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
                // TODO: replace the rectangle with logo
                Rectangle()
                    .frame(maxWidth: 180, maxHeight: 180)
                    .cornerRadius(12)
                
                VStack {
                    Text("Hanvesting")
                        .font(.nunito(.title1))
                        .frame(maxWidth: .infinity)
                    
                    Text("\"Harvesting Knowledge, Growing Wealth: Invest in Your Future!\"")
                        .font(.nunito(.caption1))
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

//
//  RiskProfileTextView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 10/10/24.
//

import SwiftUI

struct RiskProfileTextView: View {
    // Constants
    let image: Image
    let headerText: String
    let detailText: String
    
//    @State var state: RiskProfilePageState = .openingPage
    
    //    @ViewBuilder
    //    var openingOrResult: some View {
    //        if let image = image {
    //            image
    //        } else if let number = number {
    //            Text("\(number)")
    //        }
    //    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 230) {
                ZStack {
                    VStack(spacing: 104) {
                        VStack(spacing: 8) {
                            Text("\(headerText)")
                                .frame(maxWidth: .infinity)
                            
                            Text("\(detailText)")
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            // TODO: replace the rectangle with logo
                            Rectangle()
                                .frame(maxWidth: 180, maxHeight: 180)
                                .cornerRadius(12)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 37)
                .padding(.top, 140)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                ZStack {
                    HanvestButtonDefault(title: "Start", action: {})
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 54)
                .frame(maxWidth: .infinity, alignment: .bottom)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    RiskProfileTextView(
        image: Image(systemName: "checkmark"),
        headerText: "Welcome to Hanvesting",
        detailText: "Customize your learning journey\nTake a moment to answer a quick questions")
}

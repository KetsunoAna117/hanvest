//
//  Module02View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 15/10/24.
//

import SwiftUI

struct Module02View: View {
    // Constants
    let totalPage = 2
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    
    var body: some View {
        ZStack {
            Color.background
            
            ZStack {
                
            }
            .padding(.top, 71)
            .padding(.bottom, 54)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    Module02View()
}

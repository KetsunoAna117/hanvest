//
//  Module04View.swift
//  hanvest
//
//  Created by Bryan Vernanda on 18/10/24.
//

import SwiftUI

struct Module04View: View {
    let progressBarMinValue: Int = 0
    let progressBarMaxValue: Int = 100
    let completionItem: CompletionItem = .module04
    
    @State private var currentTab: Int = 0
    @State private var progressBarCurrValue: Int = 4
    @State private var pageState: Module04PageState = .pageContinue
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Module04View()
}

//
//  ModuleJourneyView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct ModuleJourneyView: View {
    // Constant
    let numberOfModules: Int = 6
    let maxModulesVisible: Int = 6
    let eachModuleNumberHeight: CGFloat = 80
    let moduleSpacing: CGFloat = 24
    
    @ViewBuilder
    var moduleListView: some View {
        VStack(spacing: moduleSpacing) {
            ForEach(1...numberOfModules, id: \.self) { number in
                HStack {
                    HanvestModuleNumberButton(number: number, action: {})
                }
                .frame(maxWidth: .infinity, alignment: moduleNumberButtonAlignmentLayout(for: number))
                .frame(height: eachModuleNumberHeight)
            }
        }
        .padding(.horizontal, moduleSpacing)
    }
    
    var body: some View {
        let totalHeight = CGFloat(maxModulesVisible) * (eachModuleNumberHeight + moduleSpacing) - moduleSpacing
        
        if numberOfModules > maxModulesVisible {
            ScrollView {
                moduleListView
            }
            .frame(height: totalHeight)
        } else {
            moduleListView
        }
    }
    
    func moduleNumberButtonAlignmentLayout(for number: Int) -> Alignment {
        let positionInCycle = number % 4
        
        switch positionInCycle {
        case 1, 3:
            return .center
        case 2:
            return .trailing
        case 0:
            return .leading
        default:
            return .center
        }
    }
}

#Preview {
    ModuleJourneyView()
}

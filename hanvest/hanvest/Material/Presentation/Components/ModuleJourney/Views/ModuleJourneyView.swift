//
//  ModuleJourneyView.swift
//  hanvest
//
//  Created by Bryan Vernanda on 12/10/24.
//

import SwiftUI

struct ModuleJourneyView: View {
    // Constant
    let maxModulesVisible: Int = 6
    let eachModuleNumberHeight: CGFloat = 80
    let moduleSpacing: CGFloat = 24
    
    // View Model
    @State private var viewModel = ModuleJourneyViewModel()
    
    @ViewBuilder
    var moduleListView: some View {
        VStack(spacing: moduleSpacing) {
            ForEach(1...viewModel.numberOfModules, id: \.self) { number in
                HStack {
                    HanvestModuleNumberButton(
                        style:
                            viewModel.getUserModuleProgress(
                                moduleIndex: number
                            ),
                        number:
                            number,
                        action: {
                            
                        // TODO: Do action for every module, the viewModel.updateUserModuleProgressIfDone should be triggered only when a module is Done
                
                        viewModel.updateUserModuleProgressIfDone(
                            moduleIndex: number
                        )
                    })
                }
                .frame(maxWidth: .infinity, alignment: moduleNumberButtonAlignmentLayout(for: number))
                .frame(height: eachModuleNumberHeight)
            }
        }
        .padding(.horizontal, moduleSpacing)
    }
    
    var body: some View {
        if viewModel.numberOfModules > maxModulesVisible {
            ScrollView {
                moduleListView
            }
            .frame(height: countTotalMaxHeightForScrollView())
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
    
    func countTotalMaxHeightForScrollView() -> CGFloat {
        let totalHeight = CGFloat(maxModulesVisible) * (eachModuleNumberHeight + moduleSpacing) - moduleSpacing
        
        return totalHeight
    }
}

#Preview {
    ModuleJourneyView()
}

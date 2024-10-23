//
//  Module05ScreenView.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import SwiftUI

struct Module05ScreenView: View {
    let router: any AppRouterProtocol
    
    @StateObject var viewmodel: Module05SimulationViewModel = .init()
    @StateObject var moduleRouter: Module05ContentRouter = .init()
    
    var body: some View {
        VStack {
            // Progress Bar
            ProgressBarWithXMarkView(
                progressBarMinValue: viewmodel.MIN_PROGRESS_VALUE,
                progressBarMaxValue: viewmodel.MAX_PROGRESS_VALUE,
                action: {
                    router.popToRoot()
                },
                progressBarCurrValue: $moduleRouter.currentProgress
            )
            .padding(.horizontal, 20)
            
            // User Header and Balance Information
            HanvestHeaderView(
                bookIconTappedAction: {
                    // User can't access this in module, hence this will do nothing
                },
                bellIconTappedAction: {
                    // User can't access this in module, hence this will do nothing
                },
                profileIconTappedAction: {
                    // User can't access this in module, hence this will do nothing
                }
            )
            .padding(.top, 12)
            
            // Simulation Content
            VStack {
                if let activeContent = moduleRouter.activeContent {
                    moduleRouter.build(activeContent)
                }
                else {
                    Text("Error Initializing Material")
                        .frame(maxHeight: .infinity, alignment: .center)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear(){
            self.viewmodel.setup(
                router: router,
                viewmodel: viewmodel,
                moduleRouter: moduleRouter
            )
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .materialModule05
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
        }
    }
}

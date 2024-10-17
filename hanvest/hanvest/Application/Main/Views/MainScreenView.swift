//
//  MainScreen.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 16/10/24.
//

import SwiftUI

struct MainScreenView: View {
    let router: any AppRouterProtocol
    
    @State private var selectionTab: HanvestMainViewTabSelection = .material
    
    var body: some View {
        VStack {
            HanvestHeaderView(
                bookIconTappedAction: {
                    print("Book Icon Tapped")
                },
                bellIconTappedAction: {
                    print("Bell Icon Tapped")
                },
                profileIconTappedAction: {
                    print("Profile Account Tapped")
                }
            )
            
            TabView(selection: $selectionTab) {
                Tab("Material",
                    systemImage: "books.vertical",
                    value: .material
                ) {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        HanvestMaterialScreenView(router: router)
                    }
                }
                
                Tab("Simulation",
                    systemImage: "chart.xyaxis.line",
                    value: .simulation
                ) {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        HanvestSimulationScreenView()
                    }
                }
                
                Tab("My Land",
                    systemImage: "globe.americas",
                    value: .land
                ) {
                    ZStack {
                        Color.background.ignoresSafeArea()
                        HanvestLandScreenView()
                    }
                }
            }
            .transition(.slide)
            .animation(.easeInOut, value: selectionTab)
        }
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .main
    
    NavigationStack(path: $appRouter.path) {
        if let startScreen = startScreen {
            appRouter.build(startScreen)
                .navigationDestination(for: Screen.self) { screen in
                    appRouter.build(screen)
                }
                .overlay {
                    if let popup = appRouter.popup {
                        ZStack {
                            appRouter.build(popup)
                        }
                       
                    }
                }
        }
    }
}

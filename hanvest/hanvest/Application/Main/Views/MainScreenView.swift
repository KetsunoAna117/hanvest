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
    @EnvironmentObject var simulationViewModel: HanvestSimulationViewModel
    
    var body: some View {
        VStack {
            HanvestHeaderView(
                bookIconTappedAction: {
                    print("Book Icon Tapped")
                    router.push(.glossary)
                },
                bellIconTappedAction: {
                    print("Bell Icon Tapped")
                    router.push(.news)
                },
                profileIconTappedAction: {
                    print("Profile Account Tapped")
                    router.push(.profile)
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
                        HanvestSimulationView(router: router)
                            .environmentObject(simulationViewModel)
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
        .onAppear(){
            @Inject var getUserData: GetUserData
            
            if let user = getUserData.execute() {
                print("[!] Current User Progress: \(user.moduleCompletionList)")
            }
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
        }
    }
}

//
//  ContentView.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    // Router
    let router: any AppRouterProtocol
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            HanvestButtonDefault(
                size: .medium,
                style: .filledCorrect(isDisabled: false),
                title: "Show Overlay") {
                    router.presentPopup(
                        .withoutButton(title: "Test Without Button", action: {
                            print("Overlay Dismissed")
                        })
                        
//                        .withButton(
//                            title: "Stock Regulator",
//                            desc: "Identify the three key Self-Regulatory Organizations (SROs) in Indonesia's capital market.",
//                            action: {
//                                router.push(.material)
//                            }
//                        )
                    )
                }
        }
        .padding()
    }
}

#Preview {
    @Previewable @StateObject var appRouter = AppRouter()
    @Previewable @State var startScreen: Screen? = .contentview
    
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
                        // Apply transition and animation
                        .transition(.opacity)
                        .animation(.spring(duration: 1), value: appRouter.popup)
                    }
                }
        }
    }
}

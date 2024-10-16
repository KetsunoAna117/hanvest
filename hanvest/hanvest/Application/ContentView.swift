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
                        .withHanvestPopupButton(
                            title: "News",
                            desc: "Learn action to take based on news",
                            buttonAction: {
                                print("Button Action trigerred")
                            }
                        )
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
                       
                    }
                }
        }
    }
}

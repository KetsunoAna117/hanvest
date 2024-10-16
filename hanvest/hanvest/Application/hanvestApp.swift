//
//  hanvestApp.swift
//  hanvest
//
//  Created by Benedick Wijayaputra on 30/09/24.
//

import SwiftUI

@main
struct hanvestApp: App {
    @StateObject private var appRouter = AppRouter()
    @State private var startScreen: Screen? = .main
    
    init(){
        AppModule.inject()
    }
    
    var body: some Scene {
        WindowGroup {
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
                                .transition(.opacity) // You can use other transitions like .scale, .move, etc.
                                .animation(.easeInOut(duration: 0.3), value: appRouter.popup)
                            }
                        }
                }
                else {
                    Text("ERROR: View is not routed anywhere!")
                }
            }
        }
    }
}

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
    @State private var startScreen: Screen? = .contentview
    
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
                                    Color.black.opacity(0.1).ignoresSafeArea()
                                    appRouter.build(popup)
                                }
                            }
                        }
                }
            }
        }
    }
}

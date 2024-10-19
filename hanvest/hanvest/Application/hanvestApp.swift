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
    @State private var startScreen: Screen? = .debug
    
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
                }
                else {
                    Text("ERROR: View is not routed anywhere!")
                }
            }
        }
    }
}

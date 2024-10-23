//
//  Module05View.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 23/10/24.
//

import SwiftUI

struct Module05View: View {
    let router: any AppRouterProtocol
    @StateObject var viewmodel: Module05SimulationViewModel = .init()
    
    var body: some View {
        VStack {
            Text("Hello from Module 05!")
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

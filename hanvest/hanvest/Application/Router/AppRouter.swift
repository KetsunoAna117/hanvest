//
//  AppRouter.swift
//  hanvest
//
//  Created by Hans Arthur Cupiterson on 15/10/24.
//

import SwiftUI

class AppRouter: AppRouterProtocol {
    @Published var path: NavigationPath = NavigationPath()
    @Published var popup: Popup?
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentPopup(_ popup: Popup) {
        self.popup = popup
    }
    
    func dismissPopup() {
        self.popup = nil
    }
    
    // MARK: - Presentation Style Providers
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
        case .contentview:
            ZStack {
                Color.background.ignoresSafeArea()
                ContentView(router: self)
            }
        case .onboarding:
            Text("Not yet Implemented!")
        case .material:
            VStack {
                Text("Not yet Implemented!")
                HanvestButtonDefault(title: "Press to go back") {
                    self.pop()
                }
            }
            .navigationBarBackButtonHidden()
            
        case .simulation:
            Text("Not yet Implemented!")
        case .profile:
            Text("Not yet Implemented!")
        }
    }
    
    @ViewBuilder
    func build(_ popup: Popup) -> some View {
        switch popup {
        case .tapOutsideEnabled(let view, let action):
            ZStack {
                Color.black.opacity(0.7).onTapGesture {
                    action()
                    self.dismissPopup()
                }
                
                VStack {
                    view
                }
            }
        case .tapOutsideDisabled(let view):
            ZStack {
                Color.black.opacity(0.7)
                
                VStack {
                    view
                }
            }
        }
    }
    
    
    
}
